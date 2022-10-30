class ActivitiesController < ApplicationController

      def show
        id = params[:id] 
        @activity = Activity.find(id) 
      end
    
    
      def new
        # default: render 'new' template
      end
    
      def create
        @activity = Activity.create!(activity_params)
        flash[:notice] = "#{@activity.title} was successfully created."
        redirect_to activities_path
      end
    
      def edit
        @activity = Activity.find params[:id]
      end
    
      def update
        @activity = Activity.find params[:id]
        @activity.update_attributes!(activity_params)
        flash[:notice] = "#{@activity.event_name} was successfully updated."
        redirect_to activity_path(@activity)
      end
    
      def destroy
        @activity = Activity.find(params[:id])
        @activity.destroy
        flash[:notice] = "Activity '#{@activity.event_name}' deleted."
        redirect_to activities_path
      end
    
      private
      # Making "internal" methods private is not required, but is a common practice.
      # This helps make clear which methods respond to requests, and which ones do not.
      def movie_params
        params.require(:activity).permit(:event_name, :location, :description, :release_date, :max_size, :current_size)
      end 

end
