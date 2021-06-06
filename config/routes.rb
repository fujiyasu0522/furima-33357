Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
end

# 差分表示用
