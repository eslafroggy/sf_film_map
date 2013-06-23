class Search < ActiveRecord::Base
  attr_accessible :address, :director, :genre, :movies_title, :release_year
  def movies
  	@movies  ||= find_movies
  end

  private

  def find_movies
  	movies = Movie.order(:name)
  	movies = movies.where("name like ?", "%#{movie_title}%") if movie_title.present?
		movies
  end

end
