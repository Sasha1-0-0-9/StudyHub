class ContactMailer < ApplicationMailer
  default from: 'project.red.shop@gmail.com'
  def complete_form
    mail(to: 'sashapysmenny@gmail.com', subject: 'Support')
  end
end
