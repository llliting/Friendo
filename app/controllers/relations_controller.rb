class RelationsController < ApplicationController
    def create
        if ActivityUserRelation.where(user_id: params[:user_id], activity_id: params[:activity_id]).empty?

            @activity = Activity.find(params[:activity_id])
            if @activity[:current_size] < @activity[:max_size]
                ActivityUserRelation.create!(user_id: params[:user_id], activity_id: params[:activity_id])
                @activity.increment! (:current_size)
            else
                flash[:notice] = "The activity has reached the maximum number of participants."
            end
        end
        redirect_to activities_path
    end

    def destroy
        ActivityUserRelation.where(user_id: params[:user_id], activity_id: params[:activity_id]).destroy_all
        @activity = Activity.find(params[:activity_id])
        if @activity[:current_size] > 1
            @activity.decrement! (:current_size)
        else
            ####close activity ??
        end
        redirect_to activities_path
    end
end