Rails.application.routes.draw do
  
  devise_for :users
  namespace :admin do
    resources :leagues
    resources :cups
    resources :counties
    resources :locations
    resources :price_options
    resources :users,  except: [:new]

    root to: "leagues#index"
  end

  root 'leagues#index'
  resources :counties, only: [:index]
  resources :leagues, only: [:index] do
    get :autocomplete_league_name, :on => :collection
  end
  get :twitter_search, to: 'leagues#twitter_search'


end
