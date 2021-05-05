class SupportMailer < ApplicationMailer
  default from: 'project.red.shop@gmail.com'
  def complete_form
    @user = params[:user]
    mail(to: 'studyhubhelp@gmail.com', subject: 'Support')
  end
end
