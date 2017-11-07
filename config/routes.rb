Rails.application.routes.draw do
  resources :job_managers
  #get '/job' => "job_managers#index"
  #get '/job/run' => "job_managers#new"
  #post '/job/run' => "job_managers#new"
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
