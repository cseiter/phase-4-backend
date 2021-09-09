class ConditionsController < ApplicationController

    def index
        render json: Condition.all
    end
end
