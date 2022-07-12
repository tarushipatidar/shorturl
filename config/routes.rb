Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "short_url#new"

  get "/", to: "short_url#new"

  post "/short_url", to: "short_url#create"

  get "/stats", to: "short_url#index"

  get "/:token", to: "short_url#show", as: :access_short_url
end
