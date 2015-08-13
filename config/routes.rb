Rails.application.routes.draw do
  resources :missions, only: [:index, :create, :show, :update], defaults: { format: :json }
  resources :ships, only: [:index, :create, :show, :update, :destroy], defaults: { format: :json }
  resources :telemetric_recordings, only: [:index], defaults: { format: :json }
end
