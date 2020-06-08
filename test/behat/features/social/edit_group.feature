@javascript @core @core_group
Feature: Editing a group as an admin
In order to edit a group
As an admin
So I can make changes to the group settings

Background:

Given the following "users" exist:
     | username | password | email | firstname | lastname | institution | authname | role |
     | UserA | Kupuh1pa! | UserA@example.org | Angela | User | mahara | internal | member |
     | UserB | Kupuh1pa! | UserB@example.org | Bob | User | mahara | internal | member |
And the following "groups" exist:
     | name | owner | description | grouptype | open | invitefriends | editroles | submittableto | allowarchives | members | staff |
     | GroupA | UserB | GroupA owned by UserB | course | ON | ON | all | ON | ON | admin, UserA | admin |

Scenario: Uploading groups via CSV and editing as an admin (Bug 1420590)
 Given I log in as "admin" with password "Kupuh1pa!"
 And I choose "Add groups by CSV" in "Groups" from administration menu
 # Attaching the groups via CSV
 And I attach the file "groups.csv" to "CSV file"
 When I press "Add groups by CSV"
 And I should see "Your CSV file was processed successfully."
 And I choose "Update group members by CSV" in "Groups" from administration menu
 # Verify the warnings there
 And I should see "Every CSV file upload removes all existing group members, including group administrators, completely. Ensure that you have at least one administrator for each group in your CSV file."
 # Attaching the group members via CSV
 And I attach the file "groupmembers.csv" to "CSV file"
 And I press "Update group members by CSV"
 And I log out
 # Logging back in as a user
 And I log in as "UserA" with password "Kupuh1pa!"
 And I choose "Groups" in "Engage" from main menu
 And I follow "Group Two"
 # Editing the group
 And I follow "Edit \"Group Two\" Settings"
 And I fill in the following:
 | Group name | Group awesome sauce |
 Then I press "Save group"
 And I should not see "Invalid argument supplied for foreach()"
 And I should see "Group saved successfully"

 Scenario: Editing groups as a user not via CSV
 Given I log in as "UserB" with password "Kupuh1pa!"
 And I choose "Groups" in "Engage" from main menu
 And I follow "GroupA"
 # Editing the group
 And I follow "Edit \"GroupA\" Settings"
 And I fill in the following:
 | Group name | Group awesome sauce |
 Then I press "Save group"
 # Checking for regression errors
 And I should not see "Invalid argument supplied for foreach()"
 And I should see "Group saved successfully"
 And I log out
 # Logging in as Admin
 Given I log in as "admin" with password "Kupuh1pa!"
 And I choose "Groups" in "Engage" from main menu
 And I follow "Group awesome sauce"
 # Making sure I can't edit a group I am not owner of
 And I should not see "Edit"
