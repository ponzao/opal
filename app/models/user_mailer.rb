class UserMailer < ActionMailer::Base
    def notify(user, a_subject, a_body)
        recipients user.email
        from "TEH YLLÄPITO <yllis@cs.helsinki.fi>"
        subject a_subject
        sent_on Time.now
        body :user => user, :body => a_body
    end
end
