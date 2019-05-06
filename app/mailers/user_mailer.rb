class UserMailer < ApplicationMailer
  def welcome(user)
    subject = 'Welcome to MVP Starter'
    @user = user
    recipients = []
    recipients << user.email
    mail to: recipients, subject: subject
  end
end