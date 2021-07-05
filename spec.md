# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app 
	* Used REST naming conventions to create teh CRUD routes
- [x] Use ActiveRecord for storing information in a database
	* Used ActiveRecord create, update, save, validate methods up update the database records.
- [x] Include more than one model class (e.g. User, Post, Category)
	* User, Project, Daily_report
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
	* User has_many projects
	* User has_many daily_reports
	* Project has_many users
	* Project has_many daily_reports
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
	* Daily_report belongs to User
	* Daily_report belongs to Project
- [x] Include user accounts with unique login attribute (username or email)
	* Only unique usernames can be signed up, validates password and username match when submitting login form
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
	* User can create, update, edit, and destroy only thier own daily reports
- [x] Ensure that users can't modify content created by other users
	* Uses 'current_user' helper method to verify that the current user is the same as the author to allow editing
- [x] Include user input validations
	* Includes validation within the HTML form and active record's 'validate' method in each model
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
	* Uses session[:message] to display any validation errors back to user.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message