class FollowingController < ApplicationController
  def index
    #@sort_by = sort_by
    @activities = Activity.all.order 'Date'
    # remember the correct settings for next time
  end


end
