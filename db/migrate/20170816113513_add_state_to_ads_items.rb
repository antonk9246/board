class AddStateToAdsItems < ActiveRecord::Migration[5.0]
  def change
    add_column :ads_items, :aasm_state, :string
  end
end
