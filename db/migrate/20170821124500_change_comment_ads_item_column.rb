class ChangeCommentAdsItemColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :ads_items, :comment, :text
  end
end
