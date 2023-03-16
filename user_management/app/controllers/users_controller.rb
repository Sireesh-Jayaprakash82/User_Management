class UsersController < ApplicationController
  def index
    # @roles = Role.new
    @users = @role.users.all
    render json: @users
  end

  def create
     @user.create(user_params)
    @role=Role.find_by(role_name: role_params)
    @user.role << @role
      render json: @user
    
    end
  end


  private

    def set_user
      @user = @role.users.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:full_name, :email, :username, :password)
    end

    def role_params
      params.require(:user).permit(:role)
    end

end
