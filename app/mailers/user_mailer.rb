class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def video_email(user)
    @user = user
    mail(to: @user.email, subject: "Application Stage 2")
  end
end
