Rails.application.routes.draw do
  # devise_for :admins
  # devise_for :users

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }

  devise_for :admins, controllers: {
    confirmations: 'admins/confirmations',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations',
    sessions:      'admins/sessions',
  }
  # デリートフラグ---------------------------------------------------------
  get "/users/:id/delete" => "users#delete_flag", as: "users_delete"
  get "/users/:id/return" => "users#return", as: "users_return"

  # ユーザーイメージ削除---------------------------------------------------------
  get "/users/:id/delete_profile" => "users#delete_profile", as: "users_profile"
  get "/users/:id/delete_back" => "users#delete_back", as: "users_back"
  # -----------------------------------------------------------------------------

  get "/spots/search" => "spots#search"
  resources :users

  resources :spots do
  resource :favorites, only: [:create, :destroy]
  resource :slepts, only: [:create, :destroy]
  resources :spot_images, only:[:new, :create, :destroy]
  resource :post_comments, only: [:create, :destroy]
  end

# 一users_favorite&slept-----------------------------------
  get "users/:user_id/slepts" => "users#slepts" ,as: "users_slepts"
  get "users/:user_id//favorites" => "users#favorites", as: "users_favorites"
# ------------------------------------------
  root "spots#index"
  get "/areas" => "prefectures#areas"
  get "/prefecture/:prefecture_name/" => "prefectures#show", as: "areas_prefecture"
  get "/about" => "about#about"
  get "contact" => "about#contact"
  get "agreement" => "about#agreement"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
