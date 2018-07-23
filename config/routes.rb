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
  get "/spots/search" => "spots#search"
  resources :users

  resources :spots do
  resource :favorites, only: [:create, :destroy]
  resource :slepts, only: [:create, :destroy]
  resources :spot_images, only:[:new, :create, :destroy]
  resource :post_comments, only: [:create, :destroy]
  end

# 一時的↓-----------------------------------
  get "users/:user_id/slepts" => "users#slepts" ,as: "users_slepts"
  get "users/:user_id//favorites" => "users#favorites", as: "users_favorites"
# ------------------------------------------
  root "spots#index"
  get "/areas" => "prefectures#areas"
  get "/prefecture/:prefecture_name/" => "prefectures#show", as: "areas_prefecture"

  # 県ごとのページ-----------------------------------------
  # get "/areas/:prefecture_name" => "prefectures#show"
  # スポット詳細ページ---------------------------------------
  # get "/areas/:prefecture_name/:spot_name" => "spots#show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
