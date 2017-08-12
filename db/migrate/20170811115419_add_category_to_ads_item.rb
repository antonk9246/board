class AddCategoryToAdsItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :ads_items, :category, foreign_key: true
  end
end
