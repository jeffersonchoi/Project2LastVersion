Rails.application.routes.draw do

  get 'users/:id/items/' => 'users#user_item_index', as: :user_items
  get 'users/:id/items/new' => 'users#user_item_new'
  post 'users/:id/items' => 'users#user_item_create'
  get 'users/:user_id/items/:id' => 'users#user_item_show', as: :user_item
  get 'users/:user_id/items/:id/edit' => 'users#user_item_edit'
  patch 'users/:user_id/items/:id' => 'users#user_item_update'
  resources :users

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end
