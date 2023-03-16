class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    @role = Role.find_by(role_name: role_params)

    if @user.save
      @role_assign=@user.roles << @role
      render json: {data: [@user, @role_assign]}, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end


  private

    def user_params
      params.require(:user).permit(:full_name, :email, :username, :password)
    end

    def role_params
      params.require(:user).require(:role)
    end

end
