Feature: Article Merging
	As a admin
	In order to merge related articles
	I want to merge articles together

	Background:
		Given the blog is set up
		Given the following exists:
		| title       | author |     body      | published | id |
		| Hello Moon  | Albert | Albert's Life | t         | 3  |
		| Hello Mars  | Johnny | Johnny's Life | t         | 4  |
		And I am logged into the admin panel

	Scenario: Admin merges related articles
		Given I am on the admin content page
		Then I should see "Hello Moon"
		Given I follow "Hello Moon"
		Then I should see "Merge Articles"
		And I fill in "merge_with" with "4"
		And I press "Merge"
		Then I should see "Your Articles were successfully merged."
		
