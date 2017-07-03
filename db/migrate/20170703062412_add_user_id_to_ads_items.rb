class AddUserIdToAdsItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :ads_items, :user, foreign_key: true
  end
end
