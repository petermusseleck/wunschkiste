class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
      @greeting = "Hallo!"
      @user = user
      mail :to => user.email, :subject => "Password Reset"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.request_list.subject
  #
#  def request_list(user)
#    @greeting = "Hi"

#    @user = user
#    mail :to => user.email, :subject => "Wunsch-Erfüllungs-Liste"
#  end
end
