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
  resources :users
  resources :shoppingcarts

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/checkout' => 'shoppingcarts#checkout', as: :checkout
end
