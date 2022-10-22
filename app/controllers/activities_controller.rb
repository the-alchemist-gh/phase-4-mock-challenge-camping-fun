class ActivitiesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    def index
        activities = Activity.all 
        render json: activities
    end

    def show
        activity = Activity.find(params[:id])
        render json: activity
    end

    def destroy
        delete_activity = Activity.find(params[:id])
        delete_activity.destroy
        head :no_content
    end

    private

    def render_not_found_response
        render json: { error: "Activity not found" }, status: :not_found
    end

end
