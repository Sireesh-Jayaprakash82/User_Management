Rails.application.routes.draw do
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  patch "/users/:id", to: "users#edit"
  post "/users", to: "users#create"
  delete "/users/:id", to: "users#destory"


  get "/roles", to: "roles#index"
  post "/roles", to: "roles#create"
  get "/roles/:id", to: "roles#show"
  delete "/roles/:id", to: "roles#destory"

  post "/auth/login", to: "authentication#login"
end
