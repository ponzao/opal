ActionController::Routing::Routes.draw do |map|
    map.root :controller => 'newsfeeds'
    map.logout "/sessions/logout", :controller => 'sessions', :method => :delete, :action => "destroy"
    map.join "/courses/:course_id/course_instances/:course_instance_id/exercise_groups/:id/join", :controller => 'exercise_groups', :method => :put, :action => "join"

    map.resources :users, :courses, :sessions, :newsfeeds

    map.resources :users do |user|
        user.resources :friends
    end

    map.resources :courses do |course|
        course.resources :separate_exams
        course.resources :course_instances do |ci|
            ci.resources :exercise_groups
        end
    end

    map.namespace(:admin) do |admin|
        admin.resource :mailer, :controller => "mailer" 
    end
end
