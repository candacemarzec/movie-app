class Api::ActorsController < ApplicationController

  def index
    @actors = Actor.all
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
     known_for: params["known_for"] )
    @actor.save
    render 'show.json.jbuilder'
  end  

  def update
    @actor = Actor.find(params[:id])
    @actor.first_name = params["first_name"] || @actor.first_name
    @actor.last_name = params["last_name"] || @actor.last_name
    @actor.known_for = params["known_for"] || @actor.known_for
    @actor.save
    render 'show.json.jbuilder'
  end  

  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy
    render json: {message: "Actor has been deleted."}
  end


     
end 