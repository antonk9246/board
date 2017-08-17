ActiveAdmin.register Category do
  permit_params :en, :ru

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
