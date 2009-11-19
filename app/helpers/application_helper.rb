# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    include Authentication

    def creation_time
        format_time(Time.now)
    end

    def format_time(time)
        time.strftime("%d.%m.%Y %H:%M")
    end
end
