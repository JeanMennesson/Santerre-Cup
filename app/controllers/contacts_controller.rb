class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    authorize @contact
    if @contact.deliver
      # flash.now[:notice] = 'Merci pour votre message, on essaie de vous répondre au plus vite!'
    else
      flash.now[:error] = "Impossible d'envoyer le message."
      render :new
    end
  end

  def sponsor
    @contact = Contact.new
    authorize @contact
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :captcha)
  end
end
