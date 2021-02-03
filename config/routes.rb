# frozen_string_literal: true

Rails.application.routes.draw do
  # get"URL" => "コントローラー名#アクション名"
  root 'static_pages#home'
  resources :users
  get :signup, to: 'users#new'
  # get :usershow, to:'users#show'
  # get :userindex, to:'users#index'
  resources :reports do
    resources :comments
  end
  # get :index, to: 'shops#index'
  # get :show, to: 'shops#show'
  resources :menus
  
  resources :shops
  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'
end
