class MessageMailer < ActionMailer::Base
  include ActionController::Helpers
  helper MarkdownHelper

  layout "mailer"

  def deliver_message(message)
    @message = message
    mail(subject: "[Revolution] New Message From #{ message.name }", to: "timothy.baron@gmail.com", from: "#{ message.name } <#{ message.email}>")
  end
end
