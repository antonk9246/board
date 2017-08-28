class AdsItemsController < ApplicationController
  attr_reader :user
  before_action :set_ads_item, only: %i[show edit update destroy]
  before_action :set_approve, only: [:approved]
  helper_method :sort_column, :sort_direction

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
    @ads_items = ads.page params[:page]
  end

  def search
    col = sort_column == 'user_id' ? 'users.email' : sort_column
    if params[:filter]
      @ads_items = policy_scope(AdsItem).perform_search(params[:search]).joins(:user).order(col + " " + sort_direction).filter(params[:filter])
    else
      @ads_items = policy_scope(AdsItem).perform_search(params[:search]).joins(:user).order(col + " " + sort_direction)
    end
    puts sort_column
    puts sort_direction
    @categories = Category.all
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
      redirect_to :back, notice: (t 'ad.created').to_s
    else
      render :new, notice: (t 'ad.not_created').to_s
      
    end
    authorize @ads_item
  end

  def update
    if @ads_item.update(ads_items_params)
      @ads_item.aasm_state = :draft
      @ads_item.approval_date = nil
      @ads_item.save
      redirect_to :back, notice: (t 'ad.updated').to_s
    else
      format.html { render :edit }
    end
  end

  def destroy
    @ads_item.destroy
    redirect_to :back, notice: (t 'ad.destroyed').to_s
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

  def decline
    @ads_item = AdsItem.find(params[:ads_item_id])
    @ads_item.update(ads_items_params)
    @ads_item.aasm_state = :refused
    @ads_item.save
    redirect_to :back, notice: (t 'ad.decline').to_s
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

  def sort_column
    AdsItem.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end

  def set_ads_item
    @ads_item = AdsItem.find(params[:id])
    authorize @ads_item
  end

  def ads_items_params
    params.require(:ads_item).permit(:title, :text, :category_id, :comment, { images: [] }, :approval_date, :user_id, :aasm_state)
  end
end
