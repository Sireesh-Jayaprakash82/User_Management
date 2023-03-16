class UsersController < ApplicationController
  before_action :find_user, only: %i[edit]
  before_action :authorize_request, except: %i[create]

  def index 
    @users = User.all
    render json: {data: @users}, status:200
  end

  def create
    @role=Role.find_by(role_name: role_params) 
    @user = User.new(user_params)
    @user.roles << @role
    if @user.save
      render json: {data: [ @user, @role ]}
    end
  end


  def edit
    if @user.update(user_params)
      render json: {data: @user}, status:200
    else
      render json: {error: "Not updated"}
    end
  end


  def show
    @user = User.find(params[:id])
    @roleofuser = @user.roles
    render json: {data: @user ,roleassigned: @roleofuser}
  end

  def destroy
    @User=User.find(params[:id])
    if @User.destroy
        render json: {status: "User deleted successfully"}
    else
        render json: {status: "deleting FAILED"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :username, :password)
  end

   def role_params 
    params.require(:user).require(:role)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
