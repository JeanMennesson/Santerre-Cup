# Preview all emails at http://localhost:3000/rails/mailers/profile_mailer
class ProfileMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/profile_mailer/welcome
  def welcome
    ProfileMailer.welcome
  end

end
