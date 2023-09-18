class User < ApplicationRecord
  has_secure_password
  include UserPresenter

  scope :active, -> { where(active: true) }
  has_many :device_tokens, class_name: 'UserDevice'

  # ======================== CLASS METHODS ========================== #
  def self.current
    Thread.current[:admin]
  end
  def self.current=(user)
    Thread.current[:admin] = user
  end
end
