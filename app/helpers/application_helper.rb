# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    include Authentication

    def creation_time
        Time.now.strftime("%d.%m.%Y %H:%M")
    end
end
