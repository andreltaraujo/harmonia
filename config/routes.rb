Rails.application.routes.draw do
  
  namespace :backoffice_admins do
    get 'welcome/index'
    get 'admins/index'
    get 'users/index'
    get 'contracts/index'
    get 'reps/index'
  end
  
  namespace :backoffice_users do
    get 'profile/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end

  namespace :checkout do
    resources :payments, only: [:index, :create]
    resources :notifications, only: [:index, :create]
  end
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  
  namespace :site do
    get 'welcome/index'
  end
  
  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
