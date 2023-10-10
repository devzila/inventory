module ItemTransactionPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :quantity
      t.add :transaction_type
      t.add :created_at
      t.add :updated_at
    end

    api_accessible :index, extend: :base do |t|
      t.add :user, template: :brief
    end

    api_accessible :show, extend: :base do |t|
      t.add :user, template: :brief
    end


  end
end
