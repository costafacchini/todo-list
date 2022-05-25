Rails.application.routes.draw do
  root "todos#index"

  resources :todos do
    resources :todo_items, only: [:create]
  end
end
