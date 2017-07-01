class AddImageToAdsItem < ActiveRecord::Migration[5.0]
  def change
    add_column :ads_items, :image_file, :string
  end
end
