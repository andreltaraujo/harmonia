Rails.application.routes.draw do
  
  namespace :backoffice_users do
    get 'welcome/index'
    resources :profile, except: [:delete]
  end
  
  namespace :backoffice_admins do
    get 'welcome/index'
  end
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_for :admins
  
  namespace :site do
    get 'welcome/index'
  end
  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
