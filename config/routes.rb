Rails.application.routes.draw do
  get 'home_pages/Index'

  devise_for :users
  resources :short_urls

  get "/urls/shared" => "short_urls#index", as: :shared_urls
  get "/urls" => "short_urls#index", as: :all_urls
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users" => "users#index"
  get "/user/:id" => "users#show", as: :user

  root "home_pages#Index"
end
