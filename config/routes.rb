Rails.application.routes.draw do
  resources :turns
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :create, :destroy]
  resources :messages, only: [:create]
  resources :tictactoeturns, only: [:create]
  mount ActionCable.server => '/cable'

end
