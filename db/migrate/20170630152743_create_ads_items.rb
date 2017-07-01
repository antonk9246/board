class CreateAdsItems < ActiveRecord::Migration[5.0]
  def change
    create_table :ads_items do |t|
      t.text :title
      t.text :image
      t.text :text

      t.timestamps
    end
  end
end
