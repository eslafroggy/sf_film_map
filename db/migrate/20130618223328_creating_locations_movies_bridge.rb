class CreatingLocationsMoviesBridge < ActiveRecord::Migration
 def change
   create_table :locations_movies do |t|
     t.integer :location_id
     t.integer :movie_id
   end
  end
end
