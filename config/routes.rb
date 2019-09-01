Rails.application.routes.draw do
  resources :photos
  devise_for :users
  root 'pages#landing'
  get 'pages/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
