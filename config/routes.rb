Deploytower::Application.routes.draw do
  resources :targets
  root 'targets#index'
end
