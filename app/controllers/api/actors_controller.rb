class Api::ActorsController < ApplicationController

  def single_actor
    @actor = Actor.find_by(id: 1)
    render 'single_actor.json.jbuilder'
  end  

end


