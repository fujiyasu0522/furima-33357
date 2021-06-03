class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,        null: false
      t.text       :description,      null: false
      t.integer    :status_id,        null: false
      t.integer    :delivery_cost_id, null: false
      t.integer    :delivery_area_id, null: false
      t.integer    :delivery_days_id, null: false
      t.integer    :price,            null: false
      t.references :user,             foreign_key: true
      t.integer    :category_id,      null: false
      t.timestamps
    end
  end
end