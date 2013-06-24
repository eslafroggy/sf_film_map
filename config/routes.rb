SfMovies::Application.routes.draw do
  resources :actors
  resources :movies do
  	resources :locations
  end
  resources :locations
  match "map" => "maps#index"
  root :to => 'maps#index'
  match "about" => "about#show"
  root :to => 'about#show'

end
