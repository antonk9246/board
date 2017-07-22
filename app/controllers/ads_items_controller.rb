class AdsItemsController < ApplicationController
  attr_reader :user
  before_action :set_ads_item, only: %i[show edit update destroy]
  before_action :set_approve, only: [:approved]
  before_filter :set_locale

  def index
    @ads_item = AdsItem.new

    if current_user.try(:admin?)
      @ads_items = AdsItem.where(approval_date: (Time.now - 3.day)..Time.now).order(approval_date: :desc).page params[:page]
    else
      @ads_items = AdsItem.where(approved: 't', approval_date: (Time.now - 10.day)..Time.now).order(approval_date: :desc).page params[:page]
      authorize @ads_items
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

    respond_to do |format|
      if @ads_item.save
        format.html { redirect_to @ads_item, notice: (t 'ad.created').to_s }
        format.json { render :show, status: :created, location: @ads_item }
      else
        format.html { redirect_to @ads_item, notice: (t 'ad.dont_have_title').to_s }
        format.json { render json: @ads_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ads_item.update(ads_items_params)
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

  def set_approve
    @ads_item = AdsItem.find(params[:ads_item_id])
    @ads_item.approved = true
    @ads_item.save
    redirect_to ads_items_url, notice: (t 'ad.approved').to_s
  end

  private

  def set_ads_item
    @ads_item = AdsItem.find(params[:id])
    authorize @ads_item
  end

  def ads_items_params
    params.require(:ads_item).permit(:title, :text, { images: [] }, :approved, :approval_date, :user_id)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale] = I18n.locale
  end
end
