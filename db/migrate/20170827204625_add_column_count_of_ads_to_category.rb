class AddColumnCountOfAdsToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :count_of_ads, :integer, default: 0
  end
end
