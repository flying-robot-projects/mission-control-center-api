Rails.application.routes.draw do
  resources :flights, only: [:index, :show], defaults: { format: :json }
end
