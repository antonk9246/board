class ChangeJsonTypeForImages < ActiveRecord::Migration[5.0]
  def change
    change_column :ads_items, :images, :json, using: 'images::JSON'
  end
end
