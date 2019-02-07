class Api::MoviesController < ApplicationController

  before_action :authenticate_admin, except: [:index, :show]
  
  def index
    @movies = Movie.all

    english = params[:english] 
    if english
      @movies = Movie.where("english = ?", true) 
    end 

    render 'index.json.jbuilder'
  end  

  def show
    @movie = Movie.find_by(id: params["id"])
    render 'show.html.erb'
  end 

  def create
    @movie = Movie.new(
     title: params["title"], 
     year: params["year"],
     plot: params["plot"],
     director: params["director"],
     english: params["english"])
    
    if @movie.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @movie.errors.full_messages}, status: :unprocessable_entity
    end 
  end  

  def update
    @movie = Movie.find_by(id: params["id"])
    @movie.title = params["title"] || @movie.title
    @movie.year = params["year"] || @movie.year
    @movie.plot = params["plot"] || @movie.plot
    @movie.director = params["director"] || @movie.director
    @movie.english = params["english"] || @movie.english
     
    if @movie.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @movie.errors.full_messages}, status: :unprocessable_entity
    end 
  end  

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    render json: {message: "The movie has been deleted."}
  end
end
