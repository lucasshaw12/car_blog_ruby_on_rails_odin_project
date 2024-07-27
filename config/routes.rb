# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  get "users/index"
  root "articles#home"
  get "search", to: "search#index"
  get "admin", to: "admin_dashboard#index"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  # allows for chained url routes
  # eg. /posts/1/comments/4
  resources :articles do
    resources :comments
  end
end
