Deploytower::Application.routes.draw do

  resources :targets, only: [:index, :show]

  root 'targets#index'
end
