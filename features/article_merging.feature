Feature: Article Merging
	As a admin
	In order to merge related articles
	I want to merge articles together

	Background:
		Given the blog is set up
		Given the following exists:
		| title       | author |   body    | published | id |
		| Hello Moon  | Albert | Moon Life | t         | 3  |
		| Hello Mars  | Johnny | Mars Life | t         | 4  |
		And I am logged into the admin panel

	Scenario: Admin merges related articles, and it should have text from both articles, one author, and one title
		Given I am on the admin content page
		Then I should see "Hello Moon"
		Given I follow "Hello Moon"
		Then I should see "Merge Articles"
		And I fill in "merge_with" with "4"
		And I press "Merge"
		Then I should see "Your Articles were successfully merged."
		And I should not see "Hello Mars"
		And I follow "Hello Moon"
		Then I should see "Moon LifeMars Life"
		And I should not see "Johnny"
	
	Scenario: Non-admin cannot merge articles
		Given I am on the new user page
		And I fill in "user_login" with "Daniel"
		And I fill in "user_password" with "daniel123"
		And I fill in "user_password_confirmation" with "daniel123"
		And I fill in "user_email" with "daniel@email.com"
		And I select "Blog publisher" from "user_profile_id"
		And I fill in "user_firstname" with "Daniel"
		And I fill in "user_lastname" with "Oso"
		Then I press "Save"
		And I follow "Log out"
		And I fill in "user_login" with "Daniel"
		And I fill in "user_password" with "daniel123"
		And I press "Login"
		Then I should see "All Articles"
		Then I follow "All Articles"
		And I follow "Hello Moon"
		Then I should not see "Merge Articles"
		
		
