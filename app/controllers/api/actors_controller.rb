class Api::ActorsController < ApplicationController

  def single_actor
    @actor = Actor.find_by(id: 1)
    render 'single_actor.json.jbuilder'
  end 

  def single_actor_params
    actor_id = params[:id]
    @actor = Actor.find_by(id: actor_id)
    render 'single_actor.json.jbuilder' 

  end


end