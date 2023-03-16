class UsersController < ApplicationController
  def index
    # @roles = Role.new
    @users = @role.users.all
    render json: @users
  end

  def update

    
  end
end
