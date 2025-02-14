# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  
  resources :books do
    resources :borrowings, only: [:create]
    collection do
      get 'admin', to: 'books#admin'
    end
  end
  
  resources :borrowings, only: [] do
    member do
      patch :return_book
    end
  end
  
  resource :profile, only: [:show]
  
  root 'books#index'
end