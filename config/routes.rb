Rails.application.routes.draw do
  resources :books #, except: [:index]
  # get 'books', to: 'books#index'
  # get 'books/new', to: 'books#new'
  # get 'books/:id', to: 'books#show', as: 'book'
  # get 'books/:id/edit', to: 'books#edit', as: 'edit_book'
  # patch 'books/:id', to: 'books#update'
  # post 'books', to: 'books#create'
  # delete 'books/:id', to: 'books#destroy'

  root 'books#index'
end
