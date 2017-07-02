class CreateAdsItems < ActiveRecord::Migration[5.0]
  def change
    create_table :ads_items do |t|
      t.datetime :approval_date
      t.text :title
      t.string :image
      t.text :text

      t.timestamps
    end
  end
end
