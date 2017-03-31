Rails.application.routes.draw do


  get "/usuario" => "users#index"
  get "/usuario/:id" => "users#show"
  post "/usuario/:id" => "users#update"
  delete "/usuario/:id" => "users#destroy"
  put "/usuario" => "users#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
