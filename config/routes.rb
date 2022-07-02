Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:index]
  resources :lives, :bookings
  patch '/bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
  patch '/bookings/:id/decline', to: 'bookings#decline', as: :decline_booking
  get '/search', to: 'lives#index'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
