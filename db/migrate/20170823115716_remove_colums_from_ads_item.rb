class RemoveColumsFromAdsItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :ads_items, :approved, :boolean
    remove_column :ads_items, :state, :string
  end
end
