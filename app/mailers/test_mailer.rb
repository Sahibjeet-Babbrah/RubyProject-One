class TestMailer < ApplicationMailer
  def simple_message(recipient)
    # mail(
    #   to: "sahibjeetrules@gmail.com",
    #   subject: "Testing Emailing",
    #   content_type: "text/html",
    #   body: "<html><strong>Hello There</strong> \n This email is being sent through the mail that's being sold using the code.</html>"
    # )
    mail(to: "sahibjeetrules@gmail.com", subject: 'Testing Email Delivery')
  end
end
