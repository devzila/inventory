module ItemPresenter
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :name
      t.add :description
      t.add :item_type
      t.add :quantity
      t.add :alert_quantity
    end

    api_accessible :index, extend: :base do |t|
    end

    api_accessible :show, extend: :base do |t|
      t.add :item_transactions, template: :base
    end


  end
end
