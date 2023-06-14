Rails.application.routes.draw do
  resources :users
  resources :events

  devise_for :users
  root to: "events#index"
end
