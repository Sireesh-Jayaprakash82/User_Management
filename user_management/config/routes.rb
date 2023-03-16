Rails.application.routes.draw do
  get "/users", to: "user#index"
  get "/users/:id", to: "user#show"
  patch "/users/:id", to: "user#edit"
  post "/users", to: "user#create"
  delete "/users/:id", to: "user#destory"


  get "/roles", to: "role#index"
  post "/roles", to: "role#create"
  get "/roles/:id", to: "role#show"
  delete "/roles/:id", to: "role#destory"

  post "/auth/login", to: "authentication#login"
end
