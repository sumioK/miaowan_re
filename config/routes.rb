Rails.application.routes.draw do
  post 'comments/:post_id/create' => 'comments#create'

  post 'likes/:post_id/create' => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'

  get '/' => 'homes#top'
  
  post 'posts/create' => 'posts#create'
  post 'posts/:id/destroy' => 'posts#destroy'
  post 'posts/:id/update' => 'posts#update'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/new' => 'posts#new'
  get 'posts/index' => 'posts#index'
  get 'posts/:id' => 'posts#show'

  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  post  'signup' => 'users#create'
  get 'signup' => 'users#new'

  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'
  post 'users/:id/destroy' => 'users#destroy'
end
