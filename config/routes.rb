Rails.application.routes.draw do
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'
  resources :users

  mount ActionCable.server, at: '/cable'
end
