Rails.application.routes.draw do
  scope module: :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  scope module: :public do
    get 'orders/new'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  scope module: :public do
    get 'cart_items/index'
  end
  scope module: :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/confirm'
  end
  scope module: :public do
    get 'items/index'
    get 'items/show'
  end
  scope module: :public do
    #get 'homes/top'
    root to: "homes#top"
    get 'homes/about'
  end
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    #get 'homes/top'
    root to: "homes#top"
  end
  namespace :admin do
    #root :to => "devise/sessions#new"
    #root to: 'customers#sign_in'
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end

  # 管理者用
  # URL /admin/sign_in ...
  # rootをログイン画面に設定
  #devise_scope :admin do
   # root "admin/sessions#new"
  #end
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
