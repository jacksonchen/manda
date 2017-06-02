# Preview all emails at http://localhost:3000/rails/mailers/founder_mailer
class FounderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/founder_mailer/welcome
  def welcome
    FounderMailer.welcome
  end

end
