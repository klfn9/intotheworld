Rails.application.routes.draw do

root to: 'homes#index'


# ゲストログイン
devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# 管理者側
 namespace :admin do
   resources :users, only: [:index, :show, :update]
   resources :trips, only: [:index, :show, :destroy]
   # 論理削除用のルーティング
  patch '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
  end


# ユーザー側
scope module: :public do
resources :trips do
  resources :trip_comments, only: [:create, :destroy]
end

# 検索機能
get "search" => "trips#search"
resources :users, only: [:show, :edit, :update]

# 退会確認画面
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'

  # 論理削除用のルーティング
  patch '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
