class RoomsController < ApplicationController

    def index
        render json: Room.all
    end

    def show
        render json: Room.find(params[:id])
    end

    def create
        render json: Room.create!(room_params), status: :created
    end

    def destroy
        room = Room.find_by(id: params[:id])
        if room
          room.destroy
          head :no_content
        else
          render json: { error: "Room not found" }, status: :not_found
        end
    end       

    def room_params
        params.permit(:room)
    end

end
