class AdsItemsController < ApplicationController
  def index
    @ads_item = AdsItem.new
    @ads_items = AdsItem.order(approval_date: :desc).page params[:page]
  end

  def show
    @ads_item = AdsItem.find(params[:id])
  end

  def new
    @ads_item = AdsItem.new
  end

  def edit
    @ads_item = AdsItem.find(params[:id])
  end

  def create
    @ads_item = AdsItem.new(ads_items_params)
    @ads_items = AdsItem.order(:title).page params[0]
    
    if @ads_item.save
      redirect_to @ads_item
    else
      render 'index'
    end
  end

  def update
    @ads_item = AdsItem.find(params[:id])

    if @ads_item.update(ads_items_params)
      redirect_to @ads_item
    else
      render 'edit'
    end
  end

  def destroy
    @ads_item = AdsItem.find(params[:id])
    @ads_item.destroy

    redirect_to ads_items_path
  end

  private
    def ads_items_params
      params.require(:ads_item).permit(:title, :text, {images:[]}, :approval_date)
    end

end
