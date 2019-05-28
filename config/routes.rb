Rails.application.routes.draw do
  get 'dashboards/index'
  # get 'doctors/new'
  # post 'doctors/create'
  # get 'doctors/show'

  # get 'patients/new'
  # post 'patients/create'
  # get 'patients/show'

  patch 'appointments/update'

  devise_for :users
  # devise_for :doctors
  # devise_for :patients

  resources :doctors
  resources :patients

  # resources :appointments 

  resources :appointments do
    member do
      put :confirmation
      # patch 'confirmation'
    end
  end


  # namespace :dashboard do
  #   root to: "dashboard#index"
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
