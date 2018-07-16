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
  resources :spot_images
  # resources :favorites
  # resources :slepts


  get "/slepts" => "users#slepts"
  get "/favorites" => "users#favorites"

  root "spots#index"
  get "/areas" => "prefectures#areas"
  # 県ごとのページ-----------------------------------------
  # get "/areas/:prefecture_name" => "prefectures#show"
  # スポット詳細ページ---------------------------------------
  # get "/areas/:prefecture_name/:spot_name" => "spots#show"

  resources :spots

  resources :prefectures, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end