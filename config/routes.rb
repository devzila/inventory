Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    namespace :auth do
      resources :session, only: :create
      resources :whoami, only: :index
    end
    resources :users
    resources :items do
      resources :transactions, controller: 'items/transactions'
    end
  end
end
