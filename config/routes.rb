Rails.application.routes.draw do
  root to: 'patients#index'

  resources :patients, only: [:index, :show]
end
