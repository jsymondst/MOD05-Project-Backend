Rails.application.routes.draw do
  resources :turns, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :create, :destroy, :show]
  resources :messages, only: [:create]
  resources :tictactoeturns, only: [:create]
  mount ActionCable.server => '/cable'

end
