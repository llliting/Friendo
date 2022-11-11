class RelationsController < ApplicationController
    def create
        if ActivityUserRelation.where(user_id: params[:user_id], activity_id: params[:activity_id]).empty?
            ActivityUserRelation.create!(user_id: params[:user_id], activity_id: params[:activity_id])
        end
        redirect_to activities_path
    end

    def destroy
        ActivityUserRelation.where(user_id: params[:user_id], activity_id: params[:activity_id]).destroy_all
        redirect_to activities_path
    end
end