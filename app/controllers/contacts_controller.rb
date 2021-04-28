class ContactsController < ApplicationController
	def new
@contact = Contact.new
  end

  def create
@contact = Contact.create(contact_params)
#ContactMailer.complete_form.deliver_now
#@contact.request = request
if @contact.save
	ContactMailer.complete_form.deliver_now
  flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
  redirect_to root_path
else
  flash.now[:error] = 'Cannot send message.'
  render :new
end
  end


    def complete
    @contact = Contact.find(5)
    ContactMailer.complete_form.deliver_now
  end

  private

  def contact_params
  params.require(:contact).permit(:name, :email, :message)
  end
end
