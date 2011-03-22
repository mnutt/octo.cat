OctoCat::Application.routes.draw do
  match ':user/:repo' => "repositories#show"
end
