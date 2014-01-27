Deploytower::Application.routes.draw do

  resources :targets, only: [:index, :show, :new, :create]

  root 'targets#index'
end
