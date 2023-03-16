class RolesController < ApplicationController

    def create
        @role=Role.new(params.require(:role).permit(:role_name))
        if @role.save
            render json: {data: @role}
        else
            render json: {status: "deleting FAILED"}
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
    
end
