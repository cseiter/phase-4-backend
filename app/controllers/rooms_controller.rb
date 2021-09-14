class RoomsController < ApplicationController

    def index
        render json: Room.all
    end

    def show
        render json: Room.find(params[:id])
    end
end
