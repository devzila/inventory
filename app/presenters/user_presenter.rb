module UserPresenter
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :name
      t.add :active
      t.add :email
      t.add :mobile_number
      t.add :role, template: :base
      t.add :created_at
      t.add :updated_at
    end

    api_accessible :index, extend: :base do |t|
    end

    api_accessible :login, extend: :base do |t|
    end

    api_accessible :brief do |t|
      t.add :id
      t.add :name
    end

    api_accessible :show, extend: :base do |t|
    end


  end
end
