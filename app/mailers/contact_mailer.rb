class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_mailer.subject
  #
  def contact_mailer
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
