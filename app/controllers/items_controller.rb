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
        params.permit(:item_name, :manufacturer, :model, :serial_number, :index_items_on_categories_id, :index_items_on_conditions_id, :index_items_on_rooms_id)
    end
end
