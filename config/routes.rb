Rails.application.routes.draw do
  get 'items' => 'users#items_index', as: :items
  get 'users/:id/items/' => 'users#user_item_index', as: :user_items
  get 'users/:id/items/new' => 'users#user_item_new', as: :new_user_item
  post 'users/:id/items' => 'users#user_item_create'
  get 'users/:user_id/items/:id' => 'users#user_item_show', as: :user_item
  delete 'users/:user_id/items/:item_id' => 'users#user_item_destroy'
  get 'users/:user_id/items/:id/edit' => 'users#user_item_edit', as: :edit_user_item
  patch 'users/:user_id/items/:id' => 'users#user_item_update'
  get 'shoppingcarts/' => 'shoppingcarts#index', as: :shoppingcarts
  get 'shoppingcarts/new' => 'shoppingcarts#shoppingcartitem_new', as: :new_shoppingcartitems
  post 'shoppingcarts/' => 'shoppingcarts#shoppingcartitem_create'
  get 'shoppingcarts/' => 'shoppingcarts#show', as: :shoppingcartitems, as: :item_shoppingcartitems
  get '/users' => 'users#index', as: :users

  post '/users' => 'users#create'
  get '/users/new' => 'users#new', as: :new_user
  get '/users/:id/edit' => 'users#edit', as: :edit_user
  get '/users/:id' => 'users#show', as: :user
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'
  get '/shoppingcarts' => 'shoppingcarts#index'
  post '/shoppingcarts' => 'shoppingcarts#create'
  get '/shoppingcarts/new' => 'shoppingcarts#new', as: :new_shoppingcart
  get '/shoppingcarts/:id/edit' => 'shoppingcarts#edit', as: :edit_shoppingcart
  get '/shoppingcarts/:id' => 'shoppingcarts#show', as: :shoppingcart
  patch '/shoppingcarts/:id' => 'shoppingcarts#update'
  delete '/shoppingcarts/:id' => 'shoppingcarts#destroy'





  # resources :users
  # resources :shoppingcarts

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/checkout' => 'shoppingcarts#checkout', as: :checkout
end
