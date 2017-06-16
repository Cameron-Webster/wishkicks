Rails.application.routes.draw do


  devise_for :users, :path => 'accounts'

  resources :users do
     resources :buckets, except: [:show]
    resources :buckets, path: "", as: "bucket_show", only: [:show]
  end

   resources :pins

    post  "/pins/:id/stockwatch", to: 'pins#create_stock_watch', as: "stockwatch"



  resources :sneakers do
    resources :vendors
  end

  resources :logos, only: [:new, :create, :index]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
