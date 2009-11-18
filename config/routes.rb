ActionController::Routing::Routes.draw do |map|
    map.root :controller => "login"

    map.resources :users, :courses
#    map.login '/login', :controller => 'login', :action => 'index' 
end
