Rails.application.routes.draw do


  root 'static_pages#home'

  # Added our custom 'registrations' controller to Devise in order to allow 'name' for the user
  # Tutorial here: http://jacopretorius.net/2014/03/adding-custom-fields-to-your-devise-user-model-in-rails-4.html
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show]

  resources :resources
  resources :projects
  resources :collaborations
  resources :jobs
  resources :pictures, only: [:create, :destroy]
  resources :contact_forms, only: [:new, :create]
  resources :technologies, only: [:create]

  get 'dev_login', to: 'users#dev_login'
end
