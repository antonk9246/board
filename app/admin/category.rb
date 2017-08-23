ActiveAdmin.register Category do
  permit_params :en, :ru

  before_filter :skip_sidebar!, :only => :index

  index as: :table do
    column :id
    column 'ads' do |f|
      f.ads_items.count
    end
    column :ru
    column :en
    column :created_at
  end

  member_action :destroy do
    @category = Category.find(params[:id])
    if AdsItem.where(:category_id => @category.id).count == 0
      @category.destroy
      redirect_to admin_categories_path(locale), notice: (t 'categories.delete').to_s
    else
      redirect_to admin_categories_path(locale), notice: (t 'categories.not_delete').to_s
    end
  end
end
