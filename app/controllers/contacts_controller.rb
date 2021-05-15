class ContactsController < ApplicationController
  def index; end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    # ContactMailer.complete_form.deliver_now
    flash[:notice] = 'Дякуємо за звернення. Ми обовʼязково звʼяжемось з вами пізніше!'
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :message, :email)
  end
end
