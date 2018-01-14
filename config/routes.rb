Rails.application.routes.draw do
  get 'email_users/new'

  get 'users/new'
  get 'users/edit'

  root 'static_pages#home'

  get  '/about',    to:'static_pages#about'
  get  '/home',     to:'static_pages#home'
  get  '/help',     to:'static_pages#help'

  get  '/auth/:provider/callback' => 'sessions#create_by_omniauth'
  
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get  '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :plans
  resources :participations
end
