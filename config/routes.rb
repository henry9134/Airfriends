Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users

  resources :rentals, only: [:create, :update ]
  resources :users, only: [:index, :show, :edit, :update] do
    resources :reviews, only: [:new, :create]
  end

  resources :activities, only: [:new, :create, :edit, :update, :destroy]

  root to: "pages#home"
  get "/dashboard", to: "dashboard#index", as: :dashboard
end
