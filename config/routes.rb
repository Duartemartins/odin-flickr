Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static_pages#search"
  get "/show", to: "static_pages#show", as: :show
end
