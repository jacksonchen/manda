class FounderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.founder_mailer.welcome.subject
  #
  def welcome(invite, url)
    @greeting = "Hi"
    @sender = invite.sender.seller.name
    @company = invite.sender.seller.company.name
    @url = url

    mail to: invite.email
  end
end
