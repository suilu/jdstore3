Rails.application.routes.draw do
    resources :story
  resources :comments
  root 'welcome#index'
  devise_for :users

 namespace :admin do
   resources :products
   resources :orders do
    member do
       post :cancel
       post :ship
       post :shipped
       post :return
     end
   end
 end


    resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end


  resources :products do
    member do
      post :add_to_cart
    end
    resources :comments
  end

  resources :cart_items
  resources :orders
  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  namespace :account do
   resources :orders, :favorites, only: [:index]
 end
 resources :favorites, only: [:create, :destroy]
  get '/about/', to: 'about#index'
end
