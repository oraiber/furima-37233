class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :text
      t.integer :category_id
      t.integer :item_condition_id
      t.integer :delivery_charge_id
      t.integer :area_id
      t.integer :days_id
      t.integer :price
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
