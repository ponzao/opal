# TODO Implement AdminController
class Admin::MailerController < ApplicationController
    def show
    end

    def create
        users = User.with_email_in_exercise_groups

        users.each do |u|
            UserMailer.deliver_notify(u, params[:subject], params[:body])
        end

        render :text => "Success!"
    end
end
