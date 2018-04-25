Rails.application.routes.draw do
  devise_for :users
<<<<<<< Updated upstream
  root 'tweets#index'
=======
  root to: 'tweets#index'
>>>>>>> Stashed changes
  resources :users, only: [:show, :update]
end
