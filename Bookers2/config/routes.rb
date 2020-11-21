Rails.application.routes.draw do

   devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "homes#top"
  get "home/about" => "homes#about"
  resources :books
  resources :users, only: [:index, :show, :edit, :destroy]
end
