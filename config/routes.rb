SfMovies::Application.routes.draw do
  resources :actors
  resources :movies
  resources :locations
  match "map" => "maps#index"
  root :to => 'locations#index'
end
