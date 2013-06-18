class Movie < ActiveRecord::Base
  attr_accessible :director, :movie_title, :release_year
end
