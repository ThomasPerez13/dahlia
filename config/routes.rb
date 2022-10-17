Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  get "/component", to: "pages#component"

  resources :consultations, only: [:index, :show, :new, :create] do
    resources :notes, only: [:new]
    resources :treatments, only: [:new, :create]
  end

  resources :patients, only: [:index, :show, :edit, :create, :new, :update] do
    resources :consultations, only: [:index]
  end

  resources :notes, only: [:create] do
    member do
      patch :add_to_favorites
      patch :remove_from_favorites
    end
  end

  resources :treatments, only: [:update]

  resources :teams, only: %i[index new create edit update] do
    resources :memberships, only: %i[new create update]
  end
end
