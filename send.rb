require 'action_mailer'

ActionMailer::Base.view_paths= File.dirname(__FILE__)
ActionMailer::Base.smtp_settings = {
    address:    'smtp.gmail.com',
    port:       '587',
    user_name:  ENV['EMAIL_USERNAME'],
    password:    ENV['EMAIL_PASSWORD'],
    authentication: :plain
}

class Newsletter < ActionMailer::Base
    default from: 'nycdatest@gmail.com'

    def welcome(recipient)
        @recipient = recipient
        mail(to: recipient, 
            subject: "[Signed up] Welcome #{recipient}")
    end
end

# Newsletter.welcome("adeolatemitayo@gmail.com").deliver_now

#You need a folder whose name matches the name of the class from
#actionmailer base

#In that folder
#you need at least 2 files (function).html.erb
