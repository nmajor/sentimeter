class OrganizationsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @organization = Organization.find(params[:id])
  end
end
