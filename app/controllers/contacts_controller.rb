class ContactsController < ApplicationController

  def new
    @contact = Contact.new
    @organization = Organization.find(params[:organization_id])
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to organization_path(params[:organization_id])
    else
      render :new
    end
  end


  def edit
    if params[:organization_id]
      @organization = Organization.find_by(id: params[:organization_id])
      if @organization.nil?
        redirect_to organizations_path, alert: "Organization not found"
      else
        @contact = @organization.contacts.find_by(id: params[:id])
        redirect_to organization_contacts_path(organization), alert: "Contact not found" if @contact.nil?
      end
    else
      @contact = Contact.find(params[:id])
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to organization_path(params[:organization_id])
    else
      render :edit
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :notes, :organization_id)
  end
end