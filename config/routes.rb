Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    namespace :auth do
      resources :session, only: :create
      resources :whoami, only: :index
    end
    resources :users
  end
end
