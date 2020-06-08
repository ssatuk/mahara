@javascript @core @blocktype @blocktype_newviews
Feature: Looking at the "Latest changes I can view" (newviews) block on my dashboard
    In order to see new pages across the site
    So I can know what people are up to

Background:
    Given the following "users" exist:
     | username | password | email | firstname | lastname | institution | authname | role |
     | UserA | Kupuh1pa! | UserA@example.org | Angela | User | mahara | internal | member |
     | UserB | Kupuh1pa! | UserB@example.org | Bob | User | mahara | internal | member |
    And the following "pages" exist:
      | title | description | ownertype | ownername |
      | Page UserA_01 | Page 01 | user | UserA |
      | Page UserA_02 | Page 02 | user | UserA |
      | Page UserA_03 | Page 03 | user | UserA |
      | Page UserA_04 | Page 04 | user | UserA |
      | Page UserA_05 | Page 05 | user | UserA |
      | Page UserA_06 | Page 06 | user | UserA |
    And the following "collections" exist:
      | title | description | ownertype | ownername | pages |
      | Collection UserA_01 | Collection 01 | user | UserA | Page UserA_03, Page UserA_04 |
      | Collection UserA_02 | Collection 02 | user | UserA | Page UserA_05, Page UserA_06 |
    And the following "permissions" exist:
      | title | accesstype |
      | Page UserA_01 | public |
      | Collection UserA_01 | public |

Scenario: Share pages and collections to a group.
The list of shared pages must take into account of access date (Bug 1374163)
    And I log in as "UserB" with password "Kupuh1pa!"
    Then I should see "Page UserA_01" in the "Latest changes I can view" property
    And I should see "Collection UserA_01" in the "Latest changes I can view" property
    # I shouldn't see the pages I didn't share
    And I should not see "Page UserA_02" in the "Latest changes I can view" property
    And I should not see "Collection UserA_02" in the "Latest changes I can view" property
    # I shouldn't see the individual pages in a collection
    And I should not see "Page UserA_03" in the "Latest changes I can view" property
