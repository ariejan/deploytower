Deploytower::Application.routes.draw do
  resources :targets do
    member do
      post :deploy
    end
  end

  root 'targets#index'
end
