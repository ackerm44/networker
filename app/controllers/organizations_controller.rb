class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all.sort_by {|i| i.name}
  end

  def show
    @organization = Organization.find(params[:id])
  end
end
