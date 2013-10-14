Mytinyurl::Application.routes.draw do
  get '/:id(/:desc)' => 'shorts#show', :as => 'short'
  get '/' => 'shorts#new', :as => 'new_short'
  post '/' => 'shorts#create', :as => 'shorts'
end