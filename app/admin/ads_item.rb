ActiveAdmin.register AdsItem do
  config.clear_action_items!
  actions :all, except: [:new]
  scope :all

  filter :user, as: :select,
                collection: proc { User.distinct.pluck :email, :id }
  filter :aasm_state, as: :select,
                      collection: %i[draft new refused approved archived]
  filter :created_at
  filter :approval_date

  index as: :table do
    column :id
    column :user
    column :title
    column :aasm_state
    column :comment
    column :text
    column :created_at

    column :actions do |resource|
      links = link_to I18n.t('active_admin.view'),
                      ads_item_path(resource)
      links += ' '
      links += link_to I18n.t('active_admin.edit'),
                       edit_ads_item_path(resource)
      links += ' '
      links += link_to I18n.t('active_admin.delete'),
                       admin_ads_item_path(resource),
                       confirm: 'Are you sure?', method: :delete
      links
    end
  end
  action_item do
    link_to (t 'new_ad').to_s, new_ads_item_path, method: :get
  end
end
