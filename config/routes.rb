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
  # resources :prefectures, only: [:show]

  resources :spots do
  resources :spot_images, only:[:new, :create, :edit, :destroy]
  resource :post_comments, only: [:create, :destroy]

  end
  # resources :favorites
  # resources :slepts

# 一時的↓-----------------------------------
  get "/slepts" => "users#slepts"
  get "/favorites" => "users#favorites"
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
