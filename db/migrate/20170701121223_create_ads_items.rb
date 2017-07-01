class CreateAdsItems < ActiveRecord::Migration[5.0]
  def change
    create_table :ads_items do |t|
      t.text :title
      t.text :image_url
      t.text :text
      add_column :ads_items, :image_file, :string

      t.timestamps
    end
  end
end
