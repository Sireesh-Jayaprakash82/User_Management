class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @roleofuser = @user.roles
        render json: {data: @user ,roleassigned: @roleofuser}
    end

end
