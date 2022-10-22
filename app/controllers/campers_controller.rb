class CampersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    def index
        campers = Camper.all 
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitySerializer
    end

    def create
        new_camper = Camper.create!(camper_params)
        render json: new_camper, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    private

    def camper_params
        params.permit(:id, :name, :age )
    end

    def render_not_found_response
        render json: { error: "Camper not found" }, status: :not_found
    end
end
