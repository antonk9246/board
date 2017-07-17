class AddApprovedToAdsItems < ActiveRecord::Migration[5.0]
  def change
    add_column :ads_items, :approved, :boolean
  end
end
