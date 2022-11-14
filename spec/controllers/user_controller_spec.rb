require 'rails_helper'

describe UsersController, type: :controller do
  users = [
    {:user_name => 'tester1', :first_name => 'tfn1', :last_name => 'tln1', :password => 'abcdefgh'},
    {:user_name => 'tester2', :first_name => 'tfn2', :last_name => 'tln2', :password => '12345678'},
  ]
  before do
    users.each do |user|
      post :create, :user => user
    end
  end

  describe 'register new user successfully' do
    it 'should success' do
      post :create, :user => {:user_name => 'tester3', :first_name => 'tfn3', :last_name => 'tln3', :password => '12345678'}
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'show the detail of a user successfully' do
    it 'should success' do
      post :show, :id => User.find_by(user_name:'tester1').id
      expect(response).to have_http_status(:success)
      #expect(assigns(:user)).to eq(User.find_by(user_name:'tester1'))
    end
  end

  describe 'register new user with duplicated name' do
    it 'should success' do
      post :create, :user => {:user_name => 'tester1', :first_name => 'tfn1', :last_name => 'tln1', :password => 'abcdefgh'}
      expect(response).to redirect_to(new_user_path)
    end
  end

  describe 'edit user profile successfully' do
    it 'should success' do
      session[:user_id] = '1'
      put :update, :id => User.find_by(user_name: 'tester1').id, :user => {:first_name => "tester1 first name"}
      expect(response).to redirect_to(user_path(1))
      expect(User.find_by(user_name: 'tester1').first_name).to eq('tester1 first name')
    end
  end

  describe 'edit user profile without login' do
    it 'should failed' do
      session[:user_id] = nil
      put :update, :id => User.find_by(user_name: 'tester1').id, :user => {:first_name => "tester1 first name"}
      expect(response).to redirect_to(new_session_path)
    end
  end
end