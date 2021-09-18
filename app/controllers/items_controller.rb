class ItemsController < ApplicationController

    def index
        render json: Item.all
    end

    def show
        render json: Item.find(params[:id])
    end

    def create
        render json: Item.create!(item_params), status: :created
    end

    def destroy
        item = Item.find_by(id: params[:id])
        if item
          item.destroy
          head :no_content
        else
          render json: { error: "Item not found" }, status: :not_found
        end
    end       

    def item_params
        params.permit(:item_name, :manufacturer, :model, :serial_number, :categories_id, :conditions_id, :rooms_id)
    end
end
