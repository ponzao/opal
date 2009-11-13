ActionController::Routing::Routes.draw do |map|
    #map.root :controller => "courses", :action => "index"

    map.resources :login
    map.resources :courses
end
