Rails.application.routes.draw do
  get 'home_pages/Index'

  devise_for :users
  resources :short_urls
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users" => "users#index"

  root "home_pages#Index"
end
