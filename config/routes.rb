Socraticco::Application.routes.draw do

  devise_for :users

  authenticated :user do
    root :to => 'dashboard#index'
  end

  root :to => "home#index"

  resources :users

  resources :topics
  resources :comments, :only => [:create, :destroy]

  resources :dashboard
  resources :tags

  get "topics/keywords" => "topics#keywords", :as => :keywords
end