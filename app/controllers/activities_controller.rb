class ActivitiesController < ApplicationController

      def show
        id = params[:id] 
        @activity = Activity.find(id) 
      end

      def index
        @all_categories = Activity.all_categories
    
        
        @sort_by = params[:sort_by]||session[:sort_by]||'date'
        session[:sort_by] = @sort_by
    
        if params[:categories].nil? && session[:categories].nil?
          @activities = Activity.all.order(@sort_by)	    
          @category_to_show = Hash[Activity.all_categories.collect{|i|[i, "1"]}]
          session[:categories] = Activity.all_categories
          redirect_to activities_path(:category => @category_to_show, :sort_by => 'date') and return
    
        elsif !params[:categories].nil?
          @activities = Activity.with_categories(params[:categories].keys).order(@sort_by)
          @category_to_show = params[:categories]
          session[:categories] = params[:categories].keys
    
        else #use session
          @activities = Activity.with_categories(session[:categories]).order(@sort_by)
          @category_to_show = Hash[session[:categories].collect{|i|[i, "1"]}]
          redirect_to activities_path(:categories => Hash[session[:categories].collect{|i|[i, "1"]}], :sort_by => @sort_by) and return
    
        end
    
        if @sort_by == 'date'
          @date_style = 'bg-warning hilite'
        end
        if @sort_by == 'location'
          @title_style = 'bg-warning hilite'
        end
    
      end


    
    
      def new
        # default: render 'new' template
      end
    
      def create
        @activity = Activity.create!(activity_params)
        flash[:notice] = "#{@activity.event_name} was successfully created."
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
      def activity_params
        params.require(:activity).permit(:event_name, :location, :description, :date, :max_size, :current_size, :organizer, :category)
      end 

end
