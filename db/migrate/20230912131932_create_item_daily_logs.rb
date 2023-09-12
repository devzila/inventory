class CreateItemDailyLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :item_daily_logs do |t|
      t.references :item, foreign_key: true, null: false
      t.integer :quantity, default: 0
      t.integer :alert_quantity, default: 0
      t.timestamps
    end
  end
end
