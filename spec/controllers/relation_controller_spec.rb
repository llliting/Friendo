require 'rails_helper'

describe RelationsController, type: :controller do
  activities = [
    {:event_name => 'Halloween Night', :creator_id => 1, :max_size => 10, :current_size =>3, :category => 'Entertainment', :date => '31-Oct-2022'},
    {:event_name => 'Met Sunday', :creator_id => 1, :max_size => 4, :current_size =>1, :category => 'Arts', :date => '30-Oct-2022'},
    {:event_name => 'Study Monday', :creator_id => 2, :location => 'butler library', :max_size => 6, :current_size =>2, :category => 'Education', :date => '2-Nov-2022'},
  ]

  users = [
    {:user_name => 'tester1', :first_name => 'tfn1', :last_name => 'tln1', :password => 'abcdefgh'},
    {:user_name => 'tester2', :first_name => 'tfn2', :last_name => 'tln2', :password => '12345678'},
  ]




  before do
    session[:user_id] = 1
    users.each do |user|
      User.new(user).save
    end
    activities.each do |activity|
      Activity.new(activity).save
      #post :create, :activity => activity
    end
  end


  describe 'join an event successfully' do
    it 'should success' do
      post :create, :activity_id => Activity.find_by(event_name: 'Halloween Night').id, :user_id => 1
      expect(response).to redirect_to(activities_path)
    end
  end

  describe 'join an event twice' do
    it 'should failed' do
      post :create, :activity_id => Activity.find_by(event_name: 'Halloween Night').id, :user_id => 1
      post :create, :activity_id => Activity.find_by(event_name: 'Halloween Night').id, :user_id => 1
      expect(response).to redirect_to(activities_path)
    end
  end

  describe 'leave an event successfully' do
    it 'should success' do
      post :create, :activity_id => Activity.find_by(event_name: 'Halloween Night').id, :user_id => 1
      delete :destroy, :activity_id => Activity.find_by(event_name: 'Halloween Night').id, :user_id => 1, :id => Activity.find_by(event_name: 'Halloween Night').id
      expect(response).to redirect_to(activities_path)
    end
  end
end