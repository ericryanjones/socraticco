Socraticco::Application.routes.draw do

  devise_for :users

  authenticated :user do
    root :to => 'dashboard#index'
  end

  root :to => "home#index"

  get "messages/inbox" => "messages#inbox", :as => :messages
  get "messages/sent" => "messages#sent", :as => :messages
  get "messages/trash" => "messages#destroy", :as => :messages
  get "topics/keywords" => "topics#keywords", :as => :keywords

  resources :users

  resources :topics
  resources :comments, :only => [:create, :destroy]

  resources :dashboard
  resources :tags
  resources :messages

end