Rails.application.routes.draw do
  
  namespace :backoffice_admins do
    get 'contracts/index'
  end
  namespace :backoffice_admins do
    get 'rep/index'
  end

  namespace :backoffice_admins do
    get 'admins/index'
  end
  
  namespace :checkout do
  resources :payments, only: [:create]
  resources :notifications, only: [:index, :create]
  end

  namespace :backoffice_users do
    get 'welcome/index'
    get 'welcome', to: 'welcome#edit'
    patch 'welcome', to: 'welcome#update'
    get 'profile/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end
  
  namespace :backoffice_admins do
    get 'welcome/index'
  end
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  
  namespace :site do
    get 'welcome/index'
  end
  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
