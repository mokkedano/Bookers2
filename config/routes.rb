Rails.application.routes.draw do

  devise_for :users


# ゲストログイン機能 ルーティング
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end


  root to: 'homes#top'
  get "home/about" => "homes#about", as: :"about"

  resources :books
  resources :users, only: [:index, :show, :edit, :update]

end
