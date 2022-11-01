Feature: sort activities

  As a person who wants to join activities
  So that I can find the most recent events or activities in the right category
  I want to sort the activities

  Background: activites in database

    Given the following activites exist:
      | event_name      | organizer        | location | current_size | max_size| date     |description | category|
      | Study Night     | Liting Huang     | Butler   |1             | 4       |2022-11-3 |"study night at lib"| Education|
      | Halloween Parade| Caroline Wang    | 6th ave  |   2          | 10      |2022-10-31|""          |Others  |


    Given the following users exist:
      | user_name    | first_name | last_name | password |
      | tester1      | tfn1       | tln1      | abcdefgh |
      | tester2      | tfn2       | tln2      | 12345678 |

    Then I go to the login page
    And  I fill in "Username" with "tester1"
    And  I fill in "Password" with "abcdefgh"
    And  I press "Login"



  Scenario: sort movies alphabetically
    And  I follow "Event Name"
    Then I should see "Halloween Parade" before "Study Night"

  Scenario: sort movies in increasing order of release date
    When I follow "Date"
    Then I should see "Halloween Parade" before "Study Night"

  Scenario: all categories unchecked
    Then I uncheck the following categories: Arts, Entertainment, Education, Sports, Outdoor, Others
    And I press "Refresh"
    Then I should see all the activities