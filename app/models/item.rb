class Item < ApplicationRecord
  include ItemPresenter
  has_many :item_transactions
  after_update :create_transaction

  enum :item_type, {
    KRM: 0,
    side_chain: 1
  }

	
	def update_item_transactions(transaction_type, quantity)
		self.item_transactions.create(transaction_type: transaction_type, quantity: quantity)
	end

  def create_transaction
    if saved_change_to_quantity?
      old_quantity, new_quantity = saved_change_to_quantity

      transaction_type =
        if new_quantity > old_quantity
          0
        else  new_quantity < old_quantity
          1
        end
        ActiveRecord::Base.transaction do
          item_transactions.create(transaction_type: transaction_type, quantity: new_quantity)
        end
    end
  end
end