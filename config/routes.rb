Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/update'
  get 'users/edit'
  get 'users/destroy'
  devise_for :users
  resources :lives
  resources :users, except: [:index, :show]
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
