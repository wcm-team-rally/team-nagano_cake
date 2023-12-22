Rails.application.routes.draw do

  namespace :admin do
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    root to: "homes#top"
  end

  scope module: :public do
    root to: "homes#top"
    delete "car_items/destroy_all" => "car_items#destroy_all"
    post 'orders/confirm' => "orders#confirm"
    get "orders/thanks" => "orders#thanks"

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    resources :items, only: [:index, :show]
    resources :car_items, only: [:index, :update, :destroy, :create]

    get "about" => "homes#about", as: "about"
    get "customers/mypage" => "customers#show"
    get "customers/information/edit" => "customers#edit"
    patch "customers/information" => "customers#update"
    get "customers/check" => "customers#check"
    patch "customers/withdraw" => "customers#withdraw"
  end
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
