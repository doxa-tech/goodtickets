Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "orders#new"

  get "orders/get_form", to: "orders#get_form"
  get "orders/add_item", to: "orders#add_item"

end
