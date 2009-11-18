ActionController::Routing::Routes.draw do |map|
    map.root :controller => 'sessions'
#    map.root :controller => 'users', :action => 'new' 
    map.logout "/sessions/logout", :controller => 'sessions', :method => :delete, :action => "destroy"

    map.resources :users, :courses, :sessions
end
