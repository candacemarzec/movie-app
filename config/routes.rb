Rails.application.routes.draw do
  
  namespace :api do

    get "/single_actor_url" => "actors#single_actor"

    get "/all_movies_url" => "movies#all_movies_method"

    get "/last_movie_url" => "movies#last_movie_method"

    get "/descending_movie_url" => "movies#descending_movie_method"

    get "single_query" => "actors#single_actor_params"

    get "single_segment/:id" =>
    "actors#single_actor_params"

    post "single_body" => "actors#single_actor_params"
  end  
end
