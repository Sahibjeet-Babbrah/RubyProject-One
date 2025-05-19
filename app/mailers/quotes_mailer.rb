class QuotesMailer < ApplicationMailer
  default from: "email@address.com"

  def quote_confirmation(recipient)
    mail(
      to: recipient,
      subject: "Quote Accepted",
      body: ""
    )
  end

  def quote_declined(recipient)
    mail(
      to: recipient,
      subject: "Quote Update",
      body: ""
    )
  end
end


# testEmail@srssystems.ca
# TestLogin1