@javascript @core
Feature: Participation report to show pages in a collection
   In a participation to see pages in a collection
   As an normal user I need to make changes in the group settings
   So that I can see the pages in a collection of that group

Background:
Given the following "users" exist:
 | username | password | email | firstname | lastname | institution | authname | role |
 | UserA | Kupuh1pa! | UserA@example.org | Angela | User | mahara | internal | member |
 | UserB | Kupuh1pa! | UserB@example.org | Bob | User | mahara | internal | member |
 | UserC | Kupuh1pa! | UserC@example.org | Cecilia | User | mahara | internal | member |

 And the following "groups" exist:
 | name | owner | description | grouptype | open | invitefriends | editroles | submittableto | allowarchives | members | staff |
 | Group one | UserA | GroupA owned by UserA | standard | ON | OFF | all | ON | OFF | UserB |  |

 And the following "pages" exist:
 | title | description | ownertype | ownername |
 | Page 01 | This is Page 01 | user | UserA |
 | Page 02 | This is Page 02 | user | UserA |
 | Page 03 | This is Page 03 | user | UserA |
 | Page 04 | This is Page 03 | user | UserA |
 | Group page 01 | This is Group page 01 | group | Group one |
 | Group page 02 | This is Group page 02 | group | Group one |
 | Group page 03 | This is Group page 03 | group | Group one |
 | Group page 04 | This is Group page 04 | group | Group one |

 And the following "collections" exist:
 | title | description | ownertype | ownername | pages |
 | Collection 01 | This is Collection | user | UserA | Page 01, Page 02 |
 | Group collection 01 | This is group collection | group | Group one | Group page 01, Group page 02 |

Scenario: In the participation report pages should be seen in a collection
 # Log in as a normal userA
 Given I log in as "UserA" with password "Kupuh1pa!"
 # Edit access for Page 03
 And I choose "Shared by me" in "Share" from main menu
 And I follow "Pages"
 And I click on "Edit access" in "Page 03" row
 And I select "Group one" from "accesslist[0][searchtype]"
 And I fill in "accesslist[0][startdate]" with "2015/06/15 03:00"
 And I press "Save"
 # Edit access for Collection 01
 And I click on "Edit access" in "Collection 01" row
 And I set the select2 value "Collection 01" for "editaccess_collections"
 And I select "Group one" from "accesslist[0][searchtype]"
 And I fill in "accesslist[0][startdate]" with "2015/06/15 03:00"
 And I press "Save"
 # Enable the participation report and make the group public
 And I choose "Groups" in "Engage" from main menu
 And I click on "Settings" in "Group one" row
 And I enable the switch "Participation report"
 And I enable the switch "Publicly viewable group"
 And I press "Save group"
 # Making group page 01 public
 When I click on "Group one"
 And I click on "Pages and collections" in the "Arrow-bar nav" property
 And I click on "Manage access" in "Group collection 01" card access menu
 And I select "Public" from "accesslist[0][searchtype]"
 And I press "Save"
 # Making group page 03 public
 When I click on "Pages and collections" in the "Arrow-bar nav" property
 And I click on "Manage access" in "Group page 03" card access menu
 And I select "Public" from "accesslist[0][searchtype]"
 And I press "Save"
 # Making group page 04 public
 When I click on "Pages and collections" in the "Arrow-bar nav" property
 And I click on "Manage access" in "Group page 04" card access menu
 And I select "Public" from "accesslist[0][searchtype]"
 And I press "Save"
 # UserA comments on group page 01
 When I click on "Pages and collections" in the "Arrow-bar nav" property
 And I follow "Group collection 01"
 And I fill in "Adding a comment to group page 01!" in editor "Comment"
 And I enable the switch "Make comment public"
 And I press "Comment"
 # UserA comments on group page 02
 And I press "Next page"
 And I fill in "Adding a comment to group page 02!" in editor "Comment"
 And I enable the switch "Make comment public"
 And I press "Comment"
 # UserA comments on group page 03
 And I choose "Groups" in "Engage" from main menu
 And I follow "Group one"
 And I click on "Pages and collections" in the "Arrow-bar nav" property
 And I follow "Group page 03"
 And I fill in "Adding a comment to group page 03!" in editor "Comment"
 And I enable the switch "Make comment public"
 And I press "Comment"
 # UserA comments on group page 04
 And I choose "Groups" in "Engage" from main menu
 And I follow "Group one"
 And I click on "Pages and collections" in the "Arrow-bar nav" property
 And I follow "Group page 04"
 And I fill in "Adding a comment to group page 04!" in editor "Comment"
 And I enable the switch "Make comment public"
 And I press "Comment"
 # Log out as UserA
 And I log out
 # Log in as UserB
 Given I log in as "UserB" with password "Kupuh1pa!"
 # UserB comments on the group page 01
 And I choose "Groups" in "Engage" from main menu
 And I follow "Group one"
 And I follow "Pages and collections (tab)"
 And I follow "Group collection 01"
 And I fill in "Adding a comment as UserB to group page 01!" in editor "Comment"
 And I enable the switch "Make comment public"
 And I press "Comment"
 # UserB comments on group page 02
 And I press "Next page"
 And I fill in "Adding a comment as UserB to group page 02!" in editor "Comment"
 And I enable the switch "Make comment public"
 And I press "Comment"
 # UserB comments on group page 03
 And I choose "Groups" in "Engage" from main menu
 And I follow "Group one"
 And I follow "Pages and collections (tab)"
 And I follow "Group page 03"
 And I fill in "Adding a comment as UserB to group page 03!" in editor "Comment"
 And I enable the switch "Make comment public"
 And I press "Comment"
 # UserB comments on group page 04
 And I choose "Groups" in "Engage" from main menu
 And I follow "Group one"
 And I follow "Pages and collections (tab)"
 And I follow "Group page 04"
 And I fill in "Adding a comment as UserB to group page 04!" in editor "Comment"
 And I enable the switch "Make comment public"
 And I press "Comment"
 # Log out as USer B
 And I log out
 # UserC comments on group page 01
 Given I log in as "UserC" with password "Kupuh1pa!"
 And I choose "Groups" in "Engage" from main menu
 And I follow "searching for groups"
 And I follow "Group one"
 And I follow "Pages and collections (tab)"
 And I follow "Group collection 01"
 And I fill in "Adding a comment as UserC to group page 01!" in editor "Comment"
 And I enable the switch "Make comment public"
 And I press "Comment"
 # UserC comments on group page 02
 And I press "Next page"
 And I fill in "Adding a comment to group page 02!" in editor "Comment"
 And I enable the switch "Make comment public"
 And I press "Comment"
 # UserC comments on group page 03
 And I choose "Groups" in "Engage" from main menu
 And I follow "searching for groups"
 And I follow "Group one"
 And I follow "Pages and collections (tab)"
 And I follow "Group page 03"
 And I fill in "Adding a comment as UserC to group page 03!" in editor "Comment"
 And I enable the switch "Make comment public"
 And I press "Comment"
 # UserC comments on group page 04
 And I choose "Groups" in "Engage" from main menu
 And I follow "searching for groups"
 And I follow "Group one"
 And I follow "Pages and collections (tab)"
 And I follow "Group page 04"
 And I fill in "Adding a comment as UserC to group page 04!" in editor "Comment"
 And I enable the switch "Make comment public"
 And I press "Comment"
 # Log out as User C
 And I log out
 # Log in as UserA
 Given I log in as "UserA" with password "Kupuh1pa!"
 And I choose "Groups" in "Engage" from main menu
 And I follow "Group one"
 And I click on "Report" in the "Arrow-bar nav" property
 # Check elements in Pages and collections shared with this group table
 And I should see "Collection 01" in the "Shared with this group report" property
 And I should see "Page 03" in the "Shared with this group report" property
 # Check elements in Group pages and collections table
 # the following works, but is inelegant. It would be nice to have a step to specify table then row and column by text @TODO
 And I should see "Group collection 01" in the "Group views report tr1 tc1" property
 Then I should see "4 comments" in the "Group collection 01" row
 And I should see "Angela User (2)" in the "Group views report tr1 tc2" property
 And I should see "Cecilia User (2)" in the "Group views report tr1 tc3" property
 And I should see "Group page 03" in the "Group views report tr3 tc1" property
