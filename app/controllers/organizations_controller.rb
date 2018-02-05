class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  before_action :check_current_user, only: [:show, :edit, :update, :destroy]


  def index
    @organizations = current_user.organizations.all.sort_by {|i| i.name}
    if !@organizations.empty? && !params[:query].nil?
      @organizations = Organization.search_by_location(params[:query], current_user.id)
    else
      @organizations
    end
  end

  def show
  end

  def edit
  end

  def update
    if @organization.update(organization_params)
      redirect_to organization_path(@organization)
    else
      render :edit
    end
  end

  def destroy
    @organization.destroy
    redirect_to organizations_path
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :location)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def check_current_user
    @organization = Organization.find(params[:id])
    if current_user != @organization.user_ids[0]
      redirect_to organizations_path
    end
  end

end
