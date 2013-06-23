class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movies }
    end
  end

  def show

    @movie = Movie.find(params[:id])

    @locations = []
    @movie.locations.each do|currentLocation|
      @locations.push({
        :id => currentLocation.id,
        :movie_id  => currentLocation.movies[0].id,
        :latitude => currentLocation.latitude,
        :longitude => currentLocation.longitude,
        :address => currentLocation.address,
        :fun_fact => currentLocation.fun_fact
      });
    end

    @result=Movies.find_by_title(@movie.movie_title, {
      y:@movie.release_year
    })
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie }
    end
  end

  def new
    @movie = Movie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie }
    end
  end


  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render json: @movie, status: :created, movie: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @movie = Movie.find(params[:id])
      @movie.destroy

      respond_to do |format|
        format.html { redirect_to movies_url }
        format.json { head :no_content }
      end
    end
  end

  

