class Api::ActorsController < ApplicationController

  before_action :authenticate_admin, except: [:index, :show]

  def index
    @actors = Actor.all

    sort_term = params[:sort] 
    if sort_term == "age"
      @actors = @actors.order(age: :desc) 
    else 
      @actors = @actors.order(:id)  
    end 
    render 'index.json.jbuilder'
  end  

  def show
    @actor = Actor.find_by(id: params["id"])
    render 'show.json.jbuilder'
  end 

  def create
    @actor = Actor.new(
     first_name: params["first_name"], 
     last_name: params["last_name"],
     gender: params["gender"],
     age: params["age"],
     known_for: params["known_for"], 
     movie_id: params["movie_id"])
    
    if @actor.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @actor.errors.full_messages}, status: :unprocessable_entity
    end 
  end  

  def update
    @actor = Actor.find(params[:id])
    @actor.first_name = params["first_name"] || @actor.first_name
    @actor.last_name = params["last_name"] || @actor.last_name
    @actor.gender = params["gender"] || @actor.gender
    @actor.age = params["age"] || @actor.age
    @actor.known_for = params["known_for"] || @actor.known_for
    @actor.movie_id = params["movie_id"] || @actor.movie_id
    
    if @actor.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @actor.errors.full_messages}, status: :unprocessable_entity
    end 
  end  

  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy
    render json: {message: "Actor has been deleted."}
  end


     
end 