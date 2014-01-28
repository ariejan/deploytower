Deploytower::Application.routes.draw do

  resources :targets, only: [:index, :show, :new, :create, :destroy]

  root 'targets#index'
end
