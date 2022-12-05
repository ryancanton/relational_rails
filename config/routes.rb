Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  get '/authors/:id', to: 'authors#show'
  get '/authors/:id/books', to: 'author_books#index'
  get '/authors/:id/books/new', to: 'author_books#new'
  post '/authors/:id/books', to: 'author_books#create'
  get '/books', to: 'books#index'
  get '/books/new', to: 'books#new'
  get '/books/:id', to: 'books#show'
  post '/authors', to: 'authors#create'
  patch '/authors/:id', to: 'authors#update'
  get '/authors/:id/edit', to: 'authors#edit'
end
