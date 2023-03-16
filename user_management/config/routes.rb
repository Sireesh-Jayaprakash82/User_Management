Rails.application.routes.draw do
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  patch "/users/:id", to: "users#edit"
  post "/users", to: "users#create"
  delete "/users/:id", to: "users#destory"


  get "/roles", to: "role#index"
  post "/roles", to: "role#create"
  get "/roles/:id", to: "role#show"
  delete "/roles/:id", to: "role#destory"

  post "/auth/login", to: "authentication#login"
end
