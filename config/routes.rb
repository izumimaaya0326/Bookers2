Rails.application.routes.draw do
  devise_for :users
  root to: 'books#top'
  get '/about' => "books#about"
  resources :books
  resources :users, only: [:show, :edit, :update,:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
