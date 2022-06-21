Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:index, :show]
  resources :lives
  resources :bookings
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
