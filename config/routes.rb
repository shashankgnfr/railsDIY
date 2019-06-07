Rails.application.routes.draw do
  resources :locations
  get 'dashboards/index'
 

  patch 'appointments/update'
  root to: "patients#new"
  devise_for :users
  resources :searches
  resources :doctors
  resources :patients
  resources :checkouts, only: [:new, :create, :show]

  resources :appointments do
    member do
      put :confirmation
      # patch 'confirmation'
    end
  end

 
end
