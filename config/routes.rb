Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  resources :users

  root "spots#index"
  get "/areas" => "prefectures#index"
  # 県ごとのページ-----------------------------------------
  # get "/areas/:prefecture_name" => "prefectures#show"
  # スポット詳細ページ---------------------------------------
  # get "/areas/:prefecture_name/:spot_name" => "spots#show"



  resources :prefectures, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
