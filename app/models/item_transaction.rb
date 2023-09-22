class ItemTransaction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item
	enum :transaction_type, {
    received: 0,
    issued: 1
  }

end
