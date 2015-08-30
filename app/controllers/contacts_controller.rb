class ContactsController < ApplicationController
  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      @contact.request = request
      @contact.deliver unless @contact.spam?
      redirect_to pages_contact_url, notice: 'Thank you for contacting us'
    else
      render :new
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def contact_params
    params.require(:contact).permit(:name, :email, :message, :nickname)
  end
end
