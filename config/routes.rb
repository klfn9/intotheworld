Rails.application.routes.draw do
  
root to: 'homes#top'
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

scope module: :public do
resources :trips
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
