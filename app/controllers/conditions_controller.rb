class ConditionsController < ApplicationController

    def index
        render json: Condition.all
    end

    def show
        render json: Condition.find(params[:id])
    end

    def create
        render json: Condition.create!(condition_params), status: :created
    end

    def destroy
        condition = Condition.find_by(id: params[:id])
        if condition
          condition.destroy
          head :no_content
        else
          render json: { error: "Condition not found" }, status: :not_found
        end
    end       

    def condition_params
        params.permit(:condition)
    end

end
