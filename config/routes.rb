OctoCat::Application.routes.draw do
  match ':user/:repo' => "repositories#show"
  match ':user/:repo/watch' => "repositories#watch"
  match ':short' => "urls#show", :as => :short

  match 'why/did/i/do/this' => "urls#why"
  post '/', :to => "urls#create"

  root :to => "urls#index"
end
