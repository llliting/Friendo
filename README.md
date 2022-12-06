# Friendo 

## Team members 
Liting Huang (lh3119)
Wenzhe Pei (wp2280)
Jingyi Wang (jw4204)
Zhe Wang (zw2695)

## Heroku Link
https://friendo-4152.herokuapp.com/ 

## Presentation Deck
https://docs.google.com/presentation/d/1BQDb62p7EeTjYjY2jTV_yqt5U_lToqPbWfDUghgiByM/edit?usp=sharing

## Video Link
https://www.youtube.com/watch?v=ubF0crn-LOU


## Features 
- user authentication 
- activity board 
- activity creation/deletion/edition 
- permission checking 
- capacity checking 
- join/leave activity 
- open/close activity 
- user profile

## Progress since iter-1
- permission checking 
- capacity checking 
- join/leave activity 
- user profile
- empty check 
- database improvement (e.g. added relationship relationship, added creator id for activities, etc)
- bugs fixing

## Future works 
- Organizers will be automatically participants 
- Open/close status 

## Instructions for running the application 
```
sudo bundle install --without production
bin/rake db:setup
rails server
```

## Instructions for testing 

running cucumber/user stories test
```
bundle exec cucumber
```

running rspec
```
rake spec
```


