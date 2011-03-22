OctoCat::Application.routes.draw do
  match ':user/:repo' => "repositories#show"
  match ':user/:repo/watch' => "repositories#watch"

  root :to => "home#index"
end
