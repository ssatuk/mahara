@javascript @core @share_comments
Feature: Added ID's for text blocks
In order for allow and moderate comments to save correctly
As an admin
I need to be able to save it once and not have to do it again in Edit Access screen

Background:

Given the following "groups" exist:
| name | owner | description | grouptype | open | invitefriends | editroles | submittableto | allowarchives | members | staff |
| GroupA | admin | GroupA owned by admin | standard | ON | ON | all | ON | ON | | |

And the following "pages" exist:
| title | description | ownertype | ownername |
| Page admin_01 | Page 01 | admin | admin |

Scenario: Correctly saving access rules for allowing comments (Bug 1201174)

 Given I log in as "admin" with password "Kupuh1pa!"
 And I choose "Pages and collections" in "Create" from main menu
 And I click on "Edit" in "Page admin_01" card menu
 # Sharing Page
 And I follow "Share" in the "Toolbar buttons" property
 And I set the following fields to these values:
 | accesslist[0][searchtype] | GroupA |
 And I disable the switch "Allow comments"
 And I scroll to the id "accessurl_submit_container"
 And I press "Save"

 When I choose "Pages and collections" in "Create" from main menu
 And I click on "Edit" in "Page admin_01" card menu
 When I follow "Share" in the "Toolbar buttons" property
 And I scroll to the base of id "accessurl_more_open"
 And I check "accesslist[0][allowcomments]"
 And I press "Save"

 # Checking if checked option worked
 When I choose "Pages and collections" in "Create" from main menu
 And I click on "Edit" in "Page admin_01" card menu
 When I follow "Share" in the "Toolbar buttons" property
 Then I should see "Edit access"
 And I expand the section "Advanced options"
 And the "accesslist[0][allowcomments]" checkbox should be checked
