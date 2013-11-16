Socraticco::Application.routes.draw do

  devise_for :users

  authenticated :user do
    root :to => 'dashboard#index'
  end

  root :to => "home#index"

  get "messages/recieved" => "messages#recieved", :as => :messages
  get "messages/outbox" => "messages#outbox", :as => :messages
  get "messages/outbox" => "messages#destroy", :as => :messages
  get "topics/keywords" => "topics#keywords", :as => :keywords

  resources :users

  resources :topics
  resources :comments, :only => [:create, :destroy]

  resources :dashboard
  resources :tags
  resources :messages

end