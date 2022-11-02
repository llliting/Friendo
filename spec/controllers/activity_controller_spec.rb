require 'rails_helper'

describe ActivitiesController, type: :controller do
  activities = [
    {:event_name => 'Halloween Night', :organizer => 'Caroline Wang', :max_size => 10, :current_size =>3, :category => 'Entertainment', :date => '31-Oct-2022'},
    {:event_name => 'Met Sunday', :organizer => 'Liting Huang', :max_size => 4, :current_size =>1, :category => 'Arts', :date => '30-Oct-2022'},
    {:event_name => 'Study Monday', :organizer => 'Liting Huang', :location => 'butler library', :max_size => 6, :current_size =>2, :category => 'Education', :date => '2-Nov-2022'},
  ]

  users = [
    {:user_name => 'tester1', :first_name => 'tfn1', :last_name => 'tln1', :password => 'abcdefgh'},
    {:user_name => 'tester2', :first_name => 'tfn2', :last_name => 'tln2', :password => '12345678'},
  ]




  before do
    session[:user_id] = '1'
    users.each do |user|
      User.new(user).save
    end
    activities.each do |activity|
      Activity.new(activity).save
      #post :create, :activity => activity
    end
  end


  describe 'delete an event successfully' do
    it 'should success' do
      delete :destroy, :id => Activity.find_by(event_name: 'Halloween Night').id
      expect(response).to redirect_to(activities_path)
    end
  end



  describe 'create new event successfully' do
    it 'should success' do
      post :create, :activity => {:event_name => 'Korean food', :organizer => 'Brittany', :location => 'ktown', :max_size => 5, :current_size =>2, :category => 'Others', :date => '3-Nov-2022'}
      expect(response).to redirect_to(activities_path)
    end
  end




  describe 'Updating max size' do
    it 'should update max party size field' do
      get :edit, :id => Activity.find_by(event_name:'Met Sunday').id
      put :update, :id => Activity.find_by(event_name:'Met Sunday').id, :activity => {:max_size => '8'}
      expect(assigns(:activity).max_size).to eq(8)
    end
  end

  describe 'Updating current size' do
    it 'should update current party size field' do
      get :edit, :id => Activity.find_by(event_name:'Met Sunday').id
      put :update, :id => Activity.find_by(event_name:'Met Sunday').id, :activity => {:current_size => '4'}
      expect(assigns(:activity).current_size).to eq(4)
    end
  end

  describe 'Updating organizer' do
    it 'should update organizer field' do
      get :edit, :id => Activity.find_by(event_name:'Met Sunday').id
      put :update, :id => Activity.find_by(event_name:'Met Sunday').id, :activity => {:organizer => 'Leo'}
      expect(assigns(:activity).organizer).to eq('Leo')
    end
  end

  describe 'Updating date' do
    it 'should update date field' do
      get :edit, :id => Activity.find_by(event_name:'Met Sunday').id
      put :update, :id => Activity.find_by(event_name:'Met Sunday').id, :activity => {:date => '2022-12-1'}
      expect(assigns(:activity).date).to eq('2022-12-1')
    end
  end


end
