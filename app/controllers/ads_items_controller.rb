class AdsItemsController < ApplicationController
  attr_reader :user
  before_action :authenticate_user!, only: %i[new create edit update
                                              destroy to_new decline
                                              approve return]
  before_action :authenticate_admin!, only: %i[decline approve]
  before_action :find_by_id, only: %i[show edit update destroy]
  before_action :find_by_ads_item_id, only: %i[to_new decline approve return]
  helper_method :sort_column, :sort_direction

  def index
    @ads_item = AdsItem.new
    ads = if params[:sort] == 'date'
            policy_scope(AdsItem).order("approval_date #{sort_direction}")
          elsif params[:sort] == 'author'
            policy_scope(AdsItem).order("user_id #{sort_direction}")
          else
            policy_scope(AdsItem).order(approval_date: :desc)
          end
    @ads_items = ads.page params[:page]
  end

  def search
    col = sort_column == 'user_id' ? 'users.email' : sort_column
    if !params[:filter].nil? && params[:filter] != ''
      filtered = policy_scope(AdsItem).perform_search(params[:search])
                                      .filter(params[:filter])
    else
      filtered = policy_scope(AdsItem).perform_search(params[:search])
    end
    @ads_items = filtered.reorder("#{col} #{sort_direction}")
    @categories = Category.all
  end

  def show
  end

  def new
    @ads_item = AdsItem.new
    authorize @ads_item
  end

  def edit
    authorize @ads_item
  end

  def create
    @ads_item = AdsItem.new(ads_items_params)
    @ads_items = AdsItem.order(:title).page params[0]
    @ads_item.user = current_user
    authorize @ads_item
    if @ads_item.save
      redirect_back(fallback_location: root_path,
                    notice: (t 'ad.created').to_s)
    else
      render :new, notice: (t 'ad.not_created').to_s
    end
  end

  def update
    authorize @ads_item
    if @ads_item.update(permitted_attributes(@ads_item))
      @ads_item.update_attributes!(aasm_state: :draft, approval_date: :nil)
      redirect_back(fallback_location: root_path,
                    notice: (t 'ad.updated').to_s)
    else
      render :edit
    end
  end

  def destroy
    authorize @ads_item
    @ads_item.destroy
    redirect_to root_path, notice: (t 'ad.destroyed').to_s
  end

  def to_new
    authorize @ads_item
    @ads_item.update_attributes!(aasm_state: :new)
    redirect_back(fallback_location: root_path,
                  notice: (t 'ad.published').to_s)
  end

  def approve
    authorize @ads_item
    @ads_item.update_attributes!(aasm_state: :approved,
                                 approval_date: Time.zone.now)
    redirect_back(fallback_location: root_path,
                  notice: (t 'ad.approved').to_s)
   end

  def decline
    authorize @ads_item
    @ads_item.update(permitted_attributes(@ads_item))
    @ads_item.update_attributes!(aasm_state: :refused)
    redirect_back(fallback_location: root_path,
                  notice: (t 'ad.decline').to_s)
  end

  def return
    authorize @ads_item
    @ads_item.update_attributes!(aasm_state: :draft)
    redirect_back(fallback_location: root_path,
                  notice: (t 'ad.return_to_drafts').to_s)
  end

  private

  def find_by_id
    @ads_item = AdsItem.find(params[:id])
  end

  def find_by_ads_item_id
    @ads_item = AdsItem.find(params[:ads_item_id])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    AdsItem.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end

  def ads_items_params
    params.require(:ads_item).permit(:title,
                                     :text,
                                     :category_id,
                                     images: [])
  end
end
