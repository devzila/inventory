class Item < ApplicationRecord

  enum :item_type, {
    KRM: 0,
    side_chain: 1
  }
end
