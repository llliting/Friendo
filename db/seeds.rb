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

<<<<<<< HEAD
activities = [{:event_name => 'Halloween Night', :organizer => 'Caroline Wang', :max_size => 10, :current_size =>3, :category => 'Entertainment', :date => '31-Oct-2022'},
{:event_name => 'Met Sunday', :organizer => 'Liting Huang', :max_size => 4, :current_size =>1, :category => 'Arts', :date => '30-Oct-2022'}
]

=======
>>>>>>> 36c089020458fc371c53392b52647621ea73cac0
activities.each do |activity|
  Activity.create!(activity)
end
