Rails.application.routes.draw do
  # get 'users/index',to:'users#index'
  get 'homes/home'

  # crud処理で必要なルーティングを一括指定
  resources :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
