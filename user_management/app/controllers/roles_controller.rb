class RolesController < ApplicationController
  before_action :find_role, only: %i[show]
  
  def index
    @roles = Role.all
    if @roles
      render json: @roles, status:200
    else
      render json: {error: "No roles"}
    end
  end

  def show
    if @role
      render json: @role, status:200
    else
      render json: {error: "Role does not exist"}
    end
  end

  private

  def find_role
    @role = Role.find_by(id: params[:id])
  end

end
