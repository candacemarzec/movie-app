Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get "/single_actor_url" => "actors#single_actor"
    get "/all_movies_url" => "movies#all_movies_method"
    get "/last_movie_url" => "movies#last_movie_method"
    get "/descending_movie_url" => "movies#descending_movie_method"
  end  
end
