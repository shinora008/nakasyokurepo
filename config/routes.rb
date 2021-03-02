Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
    end
  end
  resources :reports
  resources :users
  resources :shops
  resources :menus
  resources :reports
  resources :delivery_providers
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'
  post 'favorites/:report_id/create' => 'favorites#create'
  delete 'favorites/:report_id/destroy' => 'favorites#destroy'
  root 'static_pages#home'
  get :about, to: 'static_pages#about'
  get :terms, to:'static_pages#terms'
end
