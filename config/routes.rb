Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "restaurants", to: "restaurants#index", as: :index

  get "restaurants/new", to:"restaurants#new", as: :new

  post "restaurants", to:"restaurants#create"

  get "restaurants/:id", to:"restaurants#show", as: :show

  resources :restaurants do
    resources :reviews, only: [ :new, :create ]
  end

end
