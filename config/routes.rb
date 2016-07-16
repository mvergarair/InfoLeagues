Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  namespace :admin do
    resources :leagues
    resources :cups
    resources :counties
    resources :locations
    resources :price_options
    resources :prize_options
    resources :users,  except: [:new]

    root to: "leagues#index"
  end
  get 'file/:model/:id/:attribute', to: 'application#download_attachment', as: 'download_attachment'

  
  resources :counties, only: [:index]
  resources :ratings, only: [:create]
  resources :leagues, only: [:index] do
    get :autocomplete_league_name, :on => :collection
  end
  get :twitter_search, to: 'leagues#twitter_search'
  get :closest_counties , to: 'counties#closest_counties'

  get '/welcome', to: 'pages#welcome'
  root 'pages#welcome'


end
