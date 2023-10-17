class User < ApplicationRecord
  has_secure_password
  include UserPresenter

  scope :active, -> { where(active: true) }
  has_many :device_tokens, class_name: 'UserDevice'

  validates :role, presence: true


  enum :role, {
    admin: 0,
    supervisor: 1,
    stock_inventory: 2,
    wip: 3,
    fg: 4,
    purchase: 5
  } ,default: 1

  # ======================== CLASS METHODS ========================== #
  def self.current
    Thread.current[:admin]
  end
  def self.current=(user)
    Thread.current[:admin] = user
  end
end
