class ContactsController < ApplicationController
  def index; end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    ContactMailer.complete_form.deliver_now
    flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    redirect_to root_path
  end

  def complete
    @contact = Contact.last
    ContactMailer.complete_form.deliver_now
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :name, :message, :email)
  end
end
