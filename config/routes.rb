ActionController::Routing::Routes.draw do |map|
    map.root :controller => 'sessions'
#    map.root :controller => 'users', :action => 'new' 

    map.resources :users, :courses, :sessions
end
