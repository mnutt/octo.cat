OctoCat::Application.routes.draw do
  match ':user/:repo' => "repositories#show"
  root :to => "home#index"
end
