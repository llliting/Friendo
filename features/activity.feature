Feature: create a new activity

  As an event organizer
  So that I can start an event
  I want to include basic information about the activity I organize

  Background: activites in database

    Given the following activites exist:
      | event_name      | organizer        | location | current_size | max_size| date     |description | category|
      | Halloween Parade| Caroline Wang    | 6th ave  |   2          | 10      |2022-10-31|""          |others  |
      | Study Night     | Liting Huang     | Butler   |1             | 4       |2022-11-3 |"study night at lib"| education|

    Given the following users exist:
      | user_name    | first_name | last_name | password |
      | tester1      | tfn1       | tln1      | abcdefgh |
      | tester2      | tfn2       | tln2      | 12345678 |

    Then I go to the login page
    And  I fill in "Username" with "tester1"
    And  I fill in "Password" with "abcdefgh"
    And  I press "Login"



  Scenario: add event to existing activites
    When I go to the new event page
    And  I fill in "Name" with "Phanotom of the Opera"
    And  I fill in "Organizer" with "Jennifer"
    And  I fill in "Location" with "Broadway"
    #And  I fill in "2022-11-13" for "Date"
    #And  I select datetime "2022 November 2 - 19:00" as the "Date"

    And  I fill in "Current Party Size" with 2
    And  I fill in "Max Party Size" with 10
    And  I press "Save Changes"
    Then the organizer of "Phanotom of the Opera" should be "Jennifer"
    Then the location of "Phanotom of the Opera" should be "Broadway"
    #Then the date of "Phanotom of the Opera" should be "2022-11-13"
    Then the current_size of "Phanotom of the Opera" should be 2
    Then the max party size of "Phanotom of the Opera" should be 10


