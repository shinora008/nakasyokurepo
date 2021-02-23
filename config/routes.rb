# frozen_string_literal: true

Rails.application.routes.draw do
  # get"URL" => "コントローラー名#アクション名"
  root 'static_pages#home'
  get :signup, to: 'users#new'
  resources :users
  resources :shops
  resources :menus
  resources :reports
  resources :delivery_providers
  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'
  post 'favorites/:report_id/create' => 'favorites#create'
  delete 'favorites/:report_id/destroy' => 'favorites#destroy'
  get :about, to: 'static_pages#about'
  get :terms, to:'static_pages#terms'
end
