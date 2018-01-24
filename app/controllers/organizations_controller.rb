class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = Organization.all.sort_by {|i| i.name}
    if Organization.search_by_location(params[:query])
      @organizations = Organization.search_by_location(params[:query])
    else
      render :index, alert: "Location not found"
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
end
