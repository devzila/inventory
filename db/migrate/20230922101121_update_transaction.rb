class UpdateTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :item_transactions, :fcm_response, :json
  end
end
