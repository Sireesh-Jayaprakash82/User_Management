class RolesController < ApplicationController
  before_action :find_role, only: %i[show]
  # before_action :authorize_request
  
  def index
    @users = User.active.all
    if @users
      render json: {data: @users}, status:200
    else
      render json: {error: "No roles"}
    end
  end

  def create
    @role=Role.new(role_params)
    if @role.save
        render json: {data: @role}
    else
        render json: {status: "Create FAILED"}
    end
  end

  def show
    @user = @role.users
    if @user
      render json: {data: @user}, status:200
    else
      render json: {error: "No users assigned to this role"}
    end
  end

  def destroy
    @role=Role.find(params[:id])
    if @role.destroy
        render json: {status: "deleted successfully"}
    else
        render json: {status: "deleting FAILED"}
    end
  end

  private

  def find_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:role_name)
  end

end
