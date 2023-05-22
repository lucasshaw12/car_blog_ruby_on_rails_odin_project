Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#home"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # allows for chained url routes
  # eg. /posts/1/comments/4
  resources :articles do
    resources :comments
  end
end
