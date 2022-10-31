# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
activities = [{:event_name => 'Halloween Night', :organizer => 'Caroline Wang', :max_size => 10, :current_size =>3, :category => 'Entertainment', :date => '31-Oct-2022'},
{:event_name => 'Met Sunday', :organizer => 'Liting Huang', :max_size => 4, :current_size =>1, :category => 'Arts', :date => '30-Oct-2022'}
]
users = [
	{:user_name => 'tester', :first_name => 'first tester', :last_name => 'last tester', :password => 'tstpwd'}
]
activities.each do |activity|
  Activity.create!(activity)
end

users.each do |user|
	User.create!(user)
end