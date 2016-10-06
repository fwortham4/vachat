Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'

  root 'chatrooms#index'

  resource :chatrooms#, param: :id
  get '/chatrooms/:id' => 'chatrooms#show'

  resources :messages
end
