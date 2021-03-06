Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    post 'answer', to: 'answer#question'
    get 'search_subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
  end
  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end
  namespace :admins_backoffice do
    get 'welcome/index'  # home
    resources :admins    # admins crud
    resources :subjects  # subjects crud
    resources :questions # questions crud
  end
  devise_for :users
  devise_for :admins, skip: [:registrations]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'site/welcome#index'
  get 'backoffice/user', to: 'users_backoffice/welcome#index'
  get 'backoffice/admin', to: 'admins_backoffice/welcome#index'
end
