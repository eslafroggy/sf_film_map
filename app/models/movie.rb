class Movie < ActiveRecord::Base
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :locations
  attr_accessible :director, :movie_title, :release_year
end
