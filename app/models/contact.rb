class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email
  attribute :message
  attribute :nickname, captcha: true

  validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: "#{name} vous a envoyé un petit mot doux",
      to: "staff@santerrecup.com",
      from: %("#{name}" <#{email}>)
    }
  end
end
