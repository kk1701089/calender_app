Rails.application.routes.draw do
  root "posts#index"
  

  # crud処理で必要なルーティングを一括指定
  resources :posts
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
