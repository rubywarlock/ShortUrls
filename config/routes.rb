Rails.application.routes.draw do
  devise_for :users
  resources :short_urls

  get "/urls/shared" => "short_urls#index", as: :shared_urls
  get "/urls" => "short_urls#index", as: :all_urls
  get "/:short_url" => "short_urls#open"

  match "/user/:id/url/:short_url" => "users#open", via: :get, as: :go_on_url
  get "/users" => "users#index"
  get "/user/:id" => "users#show", as: :user

  root "short_urls#index"
end
