Feature: Edit an existing activity

  As an event organizer
  So that I can start an event
  I want to include basic information about the activity I organize

  Background: activites in database

    Given the following activites exist:
      | event_name      | organizer        | location | current_size | max_size| date     |description | category|
      | Halloween Parade| Caroline Wang    | 6th ave  |   2          | 10      |2022-10-31|""          |others  |
      | Study Night     | Liting Huang     | Butler   |   1          | 4       |2022-11-3 |"study night at lib"| education|

    Given the following users exist:
      | user_name    | first_name | last_name | password |
      | tester1      | tfn1       | tln1      | abcdefgh |
      | tester2      | tfn2       | tln2      | 12345678 |

    Then I go to the login page
    And  I fill in "Username" with "tester1"
    And  I fill in "Password" with "abcdefgh"
    And  I press "Login"



  Scenario: Edit current size to existing activity
    When I go to the activity edit page for "Study Night"
    And  I fill in "Current Size" with "3"
    And  I press "Update Activity Info"
    Then the current_size of "Study Night" should be 3


