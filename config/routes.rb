Shortner::Application.routes.draw do
  
  resources :links
  
  root :to => "links#public"
  
  match '/:slug' => 'links#go'
end
