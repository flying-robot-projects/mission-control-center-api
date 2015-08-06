Rails.application.routes.draw do
  resources :flights, only: [:index, :create, :show, :update], defaults: { format: :json }
  resources :ships, only: [:index, :create, :show, :update, :destroy], defaults: { format: :json }
  resources :ship_models, only: [:index, :create, :update, :destroy], defaults: { format: :json }
end
