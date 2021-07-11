Rails.application.routes.draw do

  ## maps "todos" endpoint  to "todos#index" = TodosController with index action(method)
  #get "todos", to: "todos#index"
  #
  ## maps "todos/create" endpoint  to "todos#create" = TodosController with create action(method)
  ## Query params - follows ?todo_text="<fill>"&due_date="<fill>
  #post "todos", to: "todos#create"
  #
  ## maps "todos/:id" endpoint  to "todos#show" = TodosController with index show(method)
  ## params[:id] - Hash containing (here, Path) Params of exposed endpoint
  #get "todos/:id", to: "todos#show"

  post "users/login", to: "users#login"

  get "/" => "home#index"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

  resources :todos
  resources :users
end
