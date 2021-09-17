class CategoriesController < ApplicationController

    def index
        render json: Category.all
    end

    def show
        render json: Category.find(params[:id])
    end

    def create
        render json: Category.create!(category_params), status: :created
    end

    def destroy
        category = Category.find_by(id: params[:id])
        if category
          category.destroy
          head :no_content
        else
          render json: { error: "Category not found" }, status: :not_found
        end
    end       

    def category_params
        params.permit(:category)
    end

end
