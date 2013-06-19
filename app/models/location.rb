class Location < ActiveRecord::Base
  has_and_belongs_to_many :movies
  attr_accessible :address, :fun_fact  #I removed movie_id because I created a bridge table between locations and movies
  geocoded_by :address
  after_validation :geocode 
end
