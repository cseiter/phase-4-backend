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

    def room_params
        params.permit(:room)
    end

end
