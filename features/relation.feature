Feature: join/leave an activity

  As an event participant
  I want to join or leave an activity

  Background: activites in database

    Given the following activites exist:
      | event_name      | creator_id        | location | current_size | max_size| date     |description          | category  |
      | Halloween Parade| 1                 | 6th ave  |   2          | 10      |2022-10-31|""                   | Others    |
      | Study Night     | 2                 | Butler   |   4          | 4       |2022-11-3 |"study night at lib" | Education |

    Given the following users exist:
      | user_name    | first_name | last_name | password |
      | tester1      | tfn1       | tln1      | abcdefgh |
      | tester2      | tfn2       | tln2      | 12345678 |

    Then I go to the login page
    And  I fill in "Username" with "tester1"
    And  I fill in "Password" with "abcdefgh"
    And  I press "Login"

  Scenario: Join an activity
    When I go to the details page for "Study Night"
    And I follow "Participate!"
    Then the current_size of "Study Night" should be 2
    Then I go to the details page for "Study Night"
    Then I should see "Leave!"

  Scenario: Join a full activity
    When I go to the details page for "Study Night"
    And I follow "Participate!"
    Then the current_size of "Study Night" should be 4
    Then I go to the details page for "Study Night"
    Then I should see "Leave!"

  Scenario: Leave an activity
    When I go to the details page for "Halloween Parade"
    And I follow "Participate!"
    Then I go to the details page for "Halloween Parade"
    Then the current_size of "Halloween Parade" should be 2
    Then I follow "Leave!"
    Then the current_size of "Halloween Parade" should be 1
    Then I go to the details page for "Halloween Parade"
    Then I should see "Participate!"