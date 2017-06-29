class AdsItemsController < ApplicationController
  def index
      @ads_items = AdsItem.all
  end
    
  def show
    @ads_items = AdsItem.find(params[:id])
  end
  
  def new
  end
  
  def create
    @ads_items = AdsItem.new(ads_items_params)
 
    if @ads_items.save
      redirect_to @ads_items
    else
      render 'new'
    end
  end
  
  def destroy
  @ads_items = AdsItem.find(params[:id])
  @ads_items.destroy
 
  redirect_to ads_items_path
end
  
  private
  def ads_items_params
    params.require(:ads_items).permit(:title, :image, :text)
  end
  
end
