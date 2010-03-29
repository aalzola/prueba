class KkMailer < ActionMailer::Base
  def welcome_email(user)
    recipients    'alzola.aitor@gmail.com'
    from          "My Awesome Site Notifications <notifications@example.com>"
    subject       "Welcome to My Awesome Site"
    sent_on       Time.now
    body          'kkkkkkkkkkkkk'
  end

end
