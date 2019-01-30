Rails.application.routes.draw do
  devise_for :users
  resources :short_urls

  get "/urls/shared" => "short_urls#index", as: :shared_urls
  get "/urls" => "short_urls#index", as: :all_urls
  match "/user/:id/url/:short_url" => "users#open", via: :get, as: :go_on_url
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users" => "users#index"
  get "/user/:id" => "users#show", as: :user

  get "/:short_url" => "short_urls#open"

  root "short_urls#index"
end
