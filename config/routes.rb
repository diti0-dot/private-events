Rails.application.routes.draw do
  devise_for :users
  root "events#index"

  resources :events, only: [:index, :show, :new, :create]
  resources :users, only: [:show]
  resources :event_attendees, only: [:create, :destroy]
end
