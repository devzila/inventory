module ItemTransactionPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :quantity
      t.add :transaction_type
    end

    api_accessible :index, extend: :base do |t|

    end

    api_accessible :show, extend: :base do |t|
      t.add :user, template: :base
    end


  end
end
