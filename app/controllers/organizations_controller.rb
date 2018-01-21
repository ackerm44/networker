class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = Organization.all.sort_by {|i| i.name}
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

  private
  def organization_params
    params.require(:organization).permit(:name, :location)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
