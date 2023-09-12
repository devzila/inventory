class CreateItemTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :item_transactions do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity
      t.integer :transaction_type

      t.timestamps
    end
  end
end
