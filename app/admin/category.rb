ActiveAdmin.register Category do
  actions :all, except: [:show]
  permit_params :en, :ru
  before_filter :skip_sidebar!, only: :index

  index as: :table do
    column :id
    column 'count' do |f|
      f.ads_items.count
    end
    column :ru
    column :en
    column :created_at
    actions
  end

  member_action :new do
    @category = Category.new
  end
  member_action :destroy do
    @category = Category.find(params[:id])
    if AdsItem.where(category_id: @category.id).count.zero?
      @category.destroy
      redirect_to admin_categories_path(locale),
                  notice: (t 'categories.delete').to_s
    else
      redirect_to admin_categories_path(locale),
                  notice: (t 'categories.not_delete').to_s
    end
  end
  member_action :update do
    @category = Category.find(params[:id])
    if @category.save
      redirect_to admin_categories_path(locale),
                  notice: (t 'categories.updated').to_s
    else
      render :edit
    end
  end
  form do |f|
    f.input :ru
    f.input :en
    actions
  end
end
