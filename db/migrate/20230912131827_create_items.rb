class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.integer :item_type
      t.integer :quantity, default: 0
      t.integer :alert_quantity, default: 0

      t.timestamps
    end
  end
end
