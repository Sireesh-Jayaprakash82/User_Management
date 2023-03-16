class UsersController < ApplicationController
  before_action :find_user, only: %i[edit]

  def edit
    if @user.update(user_params)
      render json: @user, status:200
    else
      render json: {error: "Not updated"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :username, :password)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

end
