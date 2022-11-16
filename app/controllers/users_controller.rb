class UsersController < ApplicationController
    before_action :user_authenticate, only: [:show, :edit, :update, :destroy]

    def index
        if session[:user_id]
            @user = User.find session[:user_id]
            if @user != nil
                redirect_to activities_path
                return
            end
        end
        redirect_to new_session_path
    end

    def show
        @user = User.find session[:user_id]
        @relations = ActivityUserRelation.where(user_id: session[:user_id])
        @activities = Array.new
        @relations.each do |relation|
            @activities.push Activity.find(relation[:activity_id])
        end


    end

    # Edit Profile
    def edit
        @user = User.find session[:user_id]
  end

  def update
    @user = User.find session[:user_id]
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@user.user_name} was successfully updated."
    redirect_to user_path(@user)
  end

    # Register
    def new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:warning] = "."
            redirect_to new_user_path
        end
    end

    # Logout
    def logout
        session[:user_id] = nil
        redirect_to root_path
    end

    def destroy
        @user = User.find(session[:user_id])
        @user.destroy
        Activity.where(creator_id: session[:user_id]).destroy_all
        logout
    end

    private
    # Making "internal" methods private is not required, but is a common practice.
    # This helps make clear which methods respond to requests, and which ones do not.
    def user_params
        params.require(:user).permit(:user_name, :first_name, :last_name, :password)
    end

    def user_authenticate
        if session[:user_id] == nil
            redirect_to new_session_path
            return
        end
    end
end
      