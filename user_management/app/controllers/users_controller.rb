class UsersController < ApplicationController
    before_action :authorize_request
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

end
