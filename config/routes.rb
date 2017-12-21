Rails.application.routes.draw do
  get 'users/new'

  get 'users/edit'

  root 'static_pages#home'

  get '/about', to:'static_pages#about'
  get '/home', to:'static_pages#home'
  get '/help', to:'static_pages#help'

end
