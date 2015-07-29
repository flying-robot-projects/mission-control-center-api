Rails.application.routes.draw do
  resources :flights, only: :show
end
