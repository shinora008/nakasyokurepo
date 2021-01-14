Rails.application.routes.draw do

  # get"URL" => "コントローラー名#アクション名"
  root 'static_pages#home'
  resources :users
  get :signup, to:'users#new'
  # get :usershow, to:'users#show'
  # get :userindex, to:'users#index'

  resources :shops
  # get :index, to: 'shops#index'
  # get :show, to: 'shops#show'
  resources :menus
  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'
end
