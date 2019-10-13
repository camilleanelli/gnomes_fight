# frozen_string_literal: true
Rails.application.routes.draw do

  resources :fights, only: [:show, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#index'

  resources :gnomes
end
