Rails.application.routes.draw do
  
  get '/features', to: 'features#index'

  resources :features , only: [:index, :create]
  
end
