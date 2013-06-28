class UserMailer < ActionMailer::Base
  default from: "merisw@hotmail.com"

  def video_email(user)
    @user = user
    mail(to: "merisw@gmail.com", subject: "Please send us a video")
  end
end
