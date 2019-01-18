class Api::MoviesController < ApplicationController
  
  def all_movies_method
    @movies = Movie.all
    render 'all_movies.json.jbuilder'
  end

  def last_movie_method
    @movie = Movie.last
    render 'last_movie.json.jbuilder'
  end

  def descending_movie_method
    @movies = Movie.order(created_at: :desc)
    render 'descending_movie.json.jbuilder'
  end
end
