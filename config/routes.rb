Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:index]
  resources :lives, :bookings
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
