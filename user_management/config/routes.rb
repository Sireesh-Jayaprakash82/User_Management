Rails.application.routes.draw do
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show", as: "user"
  # get "/users/:id", to: "users#show"
  patch "/users/:id", to: "users#edit"
  post "/users", to: "users#create"
  delete "/users/:id", to: "users#destroy"
  put "/users/deactive/:id", to: "users#deactive"

  get "/roles", to: "roles#index"
  post "/roles", to: "roles#create"
  get "/roles/:id", to: "roles#show", as: "role"
  delete "/roles/:id", to: "roles#destroy"

  post "/auth/login", to: "authentication#login"
end
