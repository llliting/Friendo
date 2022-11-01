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

#   describe 'register new user' do
#     before do 
#       get :director, :id => Movie.find_by(title: 'THX-1138').id
#     end
#     it 'should return movies with the same director' do
#       expect(response).to have_http_status(:success)
#       expect(assigns(:movies)).to include(Movie.find_by(title: 'Star Wars'))
#     end
#     it 'should not return movies with different directors' do 
#       expect(assigns(:movies)).not_to include(Movie.find_by(title: 'Iron Man'))
#     end
#   end

  describe 'edit user profile' do
    before do 
      put :edit, :id => User.find_by(user_name: 'tester1').id, :session =>  {'user_id' => 1}, :user => {:first_name => "tester1 first name"}
    end
    it 'should success' do
      expect(response).to have_http_status(:success)
    end
  end

#   describe 'Updating director' do 
#     it 'should update director field' do
#       get :edit, :id => Movie.find_by(title:'Iron Man').id
#       expect(response).to render_template('edit')
#       put :update, :id => Movie.find_by(title:'Iron Man').id, :movie => {:director => 'Jon Favreau'}
#       expect(response).to redirect_to(movie_path(Movie.find_by(title: 'Iron Man')))
#       expect(assigns(:movie).director).to eq('Jon Favreau')
#     end
#   end

#   describe 'if director does not exist' do 
#     it 'should not find similar movies' do
#       get :show, :id =>Movie.find_by(title: 'Alien').id
#       expect(response).to have_http_status(:success)
#       expect(assigns(:movie).director).not_to eq('Ridley Scott')
#       get :director, :id => Movie.find_by(title: 'Alien').id
#       expect(response).to redirect_to(movies_path)
#     end
#   end
end