Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'
  # Action Cable will be listening for WebSocket requests on ws://localhost:3000/cable.
  # It will do so by using the Rack socket hijacking API.
  # When our main application is instantiated, an instance of Action Cable will also be created.
  # Action Cable will establish a WebSocket connection on localhost:3000/cable, and begin listening for socket requests on that URI.

  root 'chatrooms#index'

  resources :chatrooms#, param: :id
  get '/chatrooms/:id' => 'chatrooms#show'

  resources :messages
end
