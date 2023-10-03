class Item < ApplicationRecord
  include ItemPresenter
  has_many :item_transactions
  # after_update :create_transaction

  enum :item_type, {
    KRM: 0,
    side_chain: 1
  }

  def create_transaction(quantity, user)
    return unless saved_change_to_quantity?

    old_quantity, new_quantity = saved_change_to_quantity
    transaction_type = new_quantity < old_quantity && 1 || 0
    transaction = self.item_transactions.create(
      transaction_type: transaction_type,
      quantity: quantity,
      user: user
    )

    fcm_response = PushNotifier.notify_item_quantity_change('Quantity changed', self)
    transaction.update_column('fcm_response', fcm_response)
  end
end