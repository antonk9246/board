class AddCommentToAdsItem < ActiveRecord::Migration[5.0]
  def change
    add_column :ads_items, :comment, :text
  end
end

