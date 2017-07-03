class AdsItemsController < ApplicationController
  before_action :set_ads_item, only: [:show, :edit, :update, :destroy]
  # GET /ads_items
  # GET /ads_items.json
  def index
    @ads_item = AdsItem.new
    @ads_items = AdsItem.order(approval_date: :desc).page params[:page]
    authorize @ads_items
  end
  # GET /ads_items/1
  # GET /ads_items/1.json
  def show
    @ads_item = AdsItem.find(params[:id])
  end
  
  # GET /ads_items/1.json
  def new
    @ads_item = AdsItem.new
    authorize @ads_item
  end
  
  # GET /ads_items/1.json
  def edit
    @ads_item = AdsItem.find(params[:id])
    authorize @ads_item
  end
  # POST /ads_items
  # POST /ads_items/1.json
  def create
    @ads_item = AdsItem.new(ads_items_params)
    @ads_items = AdsItem.order(:title).page params[0]
    @ads_item.user = current_user
    authorize @ads_item
    
  respond_to do |format|
      if @ads_item.save
        format.html { redirect_to @ads_item, notice: 'Ad was successfully created.' }
        format.json { render :show, status: :created, location: @ads_item }
      else
        format.html { render :new }
        format.json { render json: @ads_item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # if @ads_item.save
  #   redirect_to @ads_item
  #  else
  #    render 'index'
  #  end
  # end
  
  # PATCH/PUT /ads_items/1
  # PATCH/PUT /ads_items/1.json
  # def update
  #  @ads_item = AdsItem.find(params[:id])

  # if @ads_item.update(ads_items_params)
  #    redirect_to @ads_item
  #  else
  #    render 'edit'
  #  end
  #end
  def update
    respond_to do |format|
      if @ads_item.update(ads_items_params)
        format.html { redirect_to @ads_item, notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ads_item }
      else
        format.html { render :edit }
        format.json { render json: @ads_item.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /ads_items/1
  # DELETE /ads_items/1.json
  def destroy
    
  #  @ads_item = AdsItem.find(params[:id])
  #  @ads_item.destroy
  @ads_item.destroy
    respond_to do |format|
      format.html { redirect_to ads_items_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
 # redirect_to ads_items_path
  

  private
  
  def set_ads_item
      @ads_item = AdsItem.find(params[:id])
      authorize @ads_item
  end
  def ads_items_params
      params.require(:ads_item).permit(:title, :text, {images:[]}, :approval_date, :user_id)
  end

end
