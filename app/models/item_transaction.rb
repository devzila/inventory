class ItemTransaction < ApplicationRecord
  include ItemTransactionPresenter

  belongs_to :user
  belongs_to :item
	enum :transaction_type, {
    received: 0,
    issued: 1
  }

  default_scope { order('item_transactions.created_at desc') }

end
