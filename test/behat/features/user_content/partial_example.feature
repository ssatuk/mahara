@javascript @core @meta_test
Feature: Testing Behat's functionality
    In order to be able to use every functionality in Mahara is working correct
    As an admin I need to log in
    And test every link/file/button/checkbox etc. possible

Scenario: Meta test testing Behat's functionality (Bug #1387836)
    Given I log in as "admin" with password "Kupuh1pa!"
    And I am on homepage
    And I choose "Profile" from account menu
    And I follow "About me"
    And I set the following fields to these values:
    | First name | test first name |
    | Last name | test last name |
    And I press "Save profile"
    And I choose "Pages and collections" in "Create" from main menu
    # Creating a page
    And I follow "Add"
    And I click on "Page" in the dialog
    And I fill in "Page title" with "test page name 1"
    And I press "Save"
    # Verifying it saved
    And I should see "Page saved successfully"
    # Creating a collection
    And I choose "Pages and collections" in "Create" from main menu
    And I follow "Add"
    And I click on "Collection" in the dialog
    And I fill in "Collection name" with "test collection name"
    And the "Page navigation bar" checkbox should be checked
    And I press "Next: Edit collection pages"
    # Adding pages to the collection
    And I press "Add pages"
    # Verifying it added
    And I should see "You need to select a page to add to the collection."
    And the checkbox "test page name 1" should be unchecked
    And I check "test page name 1"
    And the "test page name 1" checkbox should be checked
    And I press "Add pages"
    And I follow "Next: Edit access"
    And I click on "Return to pages and collections"
    And I click on "test collection name" card menu
    And I should see "Delete"
    And I go to the homepage
    And I choose "Export" in "Manage" from main menu
    And I move backward one page
    And I move forward one page
    And I choose "Profile" from account menu
    And the "First name" field should not contain "Jinelle"
    And the "First name" field should contain "test first name"
