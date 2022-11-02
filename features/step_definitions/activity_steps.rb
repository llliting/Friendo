
Given /the following activites exist/ do |activites_table|
  activites_table.hashes.each do |activity|
    Activity.create activity
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, category_list|
  category_list.split(', ').each do |category|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{category}"}
  end
end

Then /I should see all the activites/ do
  # Make sure that all the movies in the app are visible in the table
  Activity.all.each do |activity|
    step %{I should see "#{activity.event_name}"}
  end
end

Then /the organizer of "(.*)" should be "(.*)"/ do |event_name, organizer|
  expect(Activity.find_by_event_name(event_name).organizer == organizer)
end

Then /the location of "(.*)" should be "(.*)"/ do |event_name, loc|
  expect(Activity.find_by_event_name(event_name).location == loc)
end

Then /the date of "(.*)" should be "(.*)"/ do |event_name, d|
  expect(Activity.find_by_event_name(event_name).date == d)
end

Then /the current size of "(.*)" should be "(.*)"/ do |event_name, size|
  expect(Activity.find_by_event_name(event_name).current_size == size)
end

Then /the max party size of "(.*)" should be "(.*)"/ do |event_name, size|
  expect(Activity.find_by_event_name(event_name).max_size == size)
end

Then("the current_size of {string} should be {int}") do |name, size|
  expect(Activity.find_by_event_name(name).current_size == size)
end

Then("the max party size of {string} should be {int}") do |string, int|
  expect(Activity.find_by_event_name(string).max_size == int)
end
