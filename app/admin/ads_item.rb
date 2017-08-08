ActiveAdmin.register AdsItem do

    scope :all

    form do |f|
        inputs "Details" do
            input :user
            input :title
            input :approved
        end
    end

  index :as => :table do
    column :id
    column :user
    column :title
    column :images
    column :text
    column :approved
    column :created_at
    
    column :actions do |resource|
        links = link_to I18n.t('active_admin.view'), ads_item_path(resource)

        links += link_to I18n.t('active_admin.edit'), edit_ads_item_path(resource)

        links += link_to I18n.t('active_admin.delete'), ads_item_path(resource), :confirm => 'Are you sure?', :method => :delete
            links
        end
  end
    form do |f|
        f.inputs "Product Details" do
            f.input :title
            f.input :user
            f.input :text
        end
    f.actions
    end
end
