@javascript @core @core_messages
Feature: Opening inbox messages from outside
   In order to open messages in my inbox from a direct link
   As a user
   So I can click on a link in another platform to get to my message

Background:
Given the following "users" exist:
     | username | password | email | firstname | lastname | institution | authname | role |
     | UserA | Kupuh1pa! | UserA@example.org | Angela | User | mahara | internal | member |
     | UserB | Kupuh1pa! | UserB@example.org | Bob | User | mahara | internal | member |
     | UserC | Kupuh1pa! | UserC@example.org | Cecilia | User | mahara | internal | member |
     | UserD | Kupuh1pa! | UserD@example.org | Dmitri | User | mahara | internal | member |

And the following "messages" exist:
     | emailtype | to | from | subject | messagebody | read | url | urltext |
     | friendrequest | UserA | UserB | New friend request | Friend request from Bob | 1 | user/view.php?id=[from] | Requests |
     | friendrequest | UserA | UserC | New friend request | Friend request from Cecilia | 1 | user/view.php?id=[from] | Requests |
     | friendrequest | UserA | UserD | New friend request | Friend request from Dmitri | 1 | user/view.php?id=[from] | Requests |
     | friendaccept | UserB | UserA | Friend request accepted - Bob | Friend request accepted from Bob | 1 | user/view.php?id=[to] | |
     | friendaccept | UserC | UserA | Friend request accepted - Cecilia | Friend request accepted from Cecilia | 1 | user/view.php?id=[to] | |
     | friendaccept | UserD | UserA | Friend request accepted - Dmitri | Friend request accepted from Dmitri | 1 | user/view.php?id=[to] | |

Scenario: Going to a direct link to a message will open the message directly in the inbox (Bug 1837194)
   # Log in as users
   Given I log in as "UserA" with password "Kupuh1pa!"
   # Go to a specific message and verify its body is visible - but not another's body.
   When I go directly to the message from "Cecilia User"
   Then I should see "Friend request from Cecilia" in the "#activitylist" "css_element"
   And I should not see "Friend request from Bob" in the "#activitylist" "css_element"
   # Go to another specific message and verify its body is visible - but not another's body.
   And I go directly to the message from "Bob User"
   And I should see "Friend request from Bob" in the "#activitylist" "css_element"
   And I should not see "Friend request from Cecilia" in the "#activitylist" "css_element"
