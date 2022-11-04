Rails.application.routes.draw do
  get 'consultation_groups/create'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  get "/component", to: "pages#component"

  get "/seeds", to: "pages#seeds" # Seeds


  resources :consultations, only: [:index, :show, :new, :create, :update] do
    resources :notes, only: [:new]
    resources :treatments, only: [:new, :create]
  end
  resources :treatments, only: [:edit, :update, :destroy]

  resources :patients, only: [:index, :show, :edit, :create, :new, :update] do
    resources :consultations, only: [:index]
  end

  resources :notes, only: [:create, :edit, :update, :destroy] do
    member do
      patch :add_to_favorites
      patch :remove_from_favorites
    end
  end

  resources :teams, only: %i[index new create edit update] do
    resources :memberships, only: %i[new create update]
  end
end
