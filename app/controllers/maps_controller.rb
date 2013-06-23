class MapsController < ApplicationController
  def index
    @locations = []
    Location.all.each do|currentLocation|
    	@locations.push({
    		:id => currentLocation.id,
    		:movie_id  => currentLocation.movies[0].id,
    		:latitude => currentLocation.latitude,
    		:longitude => currentLocation.longitude,
    		:address => currentLocation.address,
    		:fun_fact => currentLocation.fun_fact
    	});
    end

    @movies = []
    Movie.all.each do |currentMovie|
    	@movies[currentMovie.id] = {
    		:movie_title =>currentMovie.movie_title,
    		:release_year => currentMovie.release_year,
    		:director => currentMovie.director
	  	};
    end
  end
end
