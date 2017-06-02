class FounderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.founder_mailer.welcome.subject
  #
  def welcome(user, sender)
    @greeting = "Hi"
    @sender = sender.seller.name

    mail to: user.email
  end
end
