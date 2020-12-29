Rails.application.routes.draw do
  resources :shops
  root 'static_pages#home'
  get :index, to: 'shops#index'
end
