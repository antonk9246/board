class AdsItemsController < ApplicationController
  attr_reader :user
  before_action :set_ads_item, only: %i[show edit update destroy]
  before_action :set_approve, only: [:approved]
  helper_method :sort_direction

  def index
    @ads_item = AdsItem.new
    if params[:sort] == 'date'
      ads = policy_scope(AdsItem).order("approval_date #{sort_direction}")
    elsif params[:sort] == 'author'
      ads = policy_scope(AdsItem).order("user_id #{sort_direction}")
    else
      params[:sort] = 'date'
      ads = policy_scope(AdsItem).order(approval_date: :desc)
    end
      if params[:query].present?
        params[:sort] = 'date'
        ads = policy_scope(AdsItem).order(approval_date: :desc)
        @ads_items = ads.search_content_for(params[:query]).page params[:page]
      else
        @ads_items = ads.page params[:page]
      end
  end

  def show
    @ads_item = AdsItem.find(params[:id])
  end

  def new
    @ads_item = AdsItem.new
    authorize @ads_item
  end

  def edit
    @ads_item = AdsItem.find(params[:id])
    authorize @ads_item
  end

  def create
    @ads_item = AdsItem.new(ads_items_params)
    @ads_items = AdsItem.order(:title).page params[0]
    @ads_item.user = current_user
    authorize @ads_item
    if @ads_item.save
      flash[:notice] = t 'ad_created'
      redirect_to :back
    else
      flash[:notice] = t 'ad_not_created'
      params[:sort] = 'date'
      render :new
    end
  end

  def update
    respond_to do |format|
      if @ads_item.update(ads_items_params)
        @ads_item.aasm_state = :draft
        @ads_item.approval_date = nil
        @ads_item.save
        format.html { redirect_to @ads_item, notice: (t 'ad.updated').to_s }
        format.json { render :show, status: :ok, location: @ads_item }
      else
        format.html { render :edit }
        format.json { render json: @ads_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ads_item.destroy
    respond_to do |format|
      format.html { redirect_to ads_items_url, notice: (t 'ad.destroyed').to_s }
      format.json { head :no_content }
    end
  end

  def to_new
    @ads_item = AdsItem.find(params[:ads_item_id])
    @ads_item.aasm_state = :new
    @ads_item.save
    redirect_to :back, notice: (t 'ad.published').to_s
  end

  def approve
    @ads_item = AdsItem.find(params[:ads_item_id])
    @ads_item.aasm_state = :approved
    @ads_item.approval_date = Time.zone.now.strftime('%d.%m.%Y %H:%M')
    @ads_item.save
    redirect_to :back, notice: (t 'ad.approved').to_s
  end

  def return
    @ads_item = AdsItem.find(params[:ads_item_id])
    @ads_item.aasm_state = :draft
    @ads_item.approval_date = Time.zone.now.strftime('%d.%m.%Y %H:%M')
    @ads_item.save
    redirect_to :back, notice: (t 'ad.return_to_drafts').to_s
  end

  private

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def set_ads_item
    @ads_item = AdsItem.find(params[:id])
    authorize @ads_item
  end

  def ads_items_params
    params.require(:ads_item).permit(:title, :text, :category_id,{ images: [] }, :approved, :approval_date, :user_id, :aasm_state)
  end
end
