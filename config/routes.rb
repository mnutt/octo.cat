OctoCat::Application.routes.draw do
  match ':user/:repo' => "repositories#show", :constraints => {:repo => /[A-Za-z0-9\-\_\.]+/}
  match ':user/:repo/watch' => "repositories#watch", :constraints => {:repo => /[A-Za-z0-9\-\_\.]+/}
  match ':short' => "urls#show", :as => :short

  post '/', :to => "urls#create"

  root :to => "urls#index"
end
