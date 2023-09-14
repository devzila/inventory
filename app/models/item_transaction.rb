class ItemTransaction < ApplicationRecord
	enum :transaction_type, {
    received: 0,
    issued: 1
  }

end
