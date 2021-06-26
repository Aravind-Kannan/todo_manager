Rails.application.routes.draw do

  # maps "todos" endpoint  to "todos#index" = TodosController with index action(method)
  get "todos", to: "todos#index"

  # maps "todos/:id" endpoint  to "todos#show" = TodosController with index show(method)
  # params[:id] - Hash containing Path Params of exposed endpoint
  get "todos/:id", to: "todos#show"
end
