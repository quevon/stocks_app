Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] 
  patch 'users/:id/active', to: 'users#active', as: 'active_user'
  patch 'users/:id/inactive', to: 'users#inactive', as: 'inactive_user'



  

  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
