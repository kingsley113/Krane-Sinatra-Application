# Krane-Sinatra-Application
 Krane Daily Report App - Phase 2 Final Project

## Description
 Krane is a simple daily report app aimed at general contractors in the construction industry. The intent is to simplify submitting and saving many reports submitted by multiple users on multiple projects. From my background in the construction industry this is one of the areas that is often overlooked as it is typically a mundane, time consuming task, but very important to have records of construction progress.

 This app uses the Active Record framework to set up and maintain the database and relationship between models. An outline of the relationships is as follows:
	- A User can be assigned to many Projects 
	- A User can submit (and therefore have many) Daily Reports
	- A Project can be assigned to multiple Users
	- A Project will have many Daily Reports 
	- A Daily Report will belong to only one User
	- A Daily Report will belong to only one Project

The app includes several pages for viewing the saved information, including an 'All Reports', 'All Users', and 'All Projects' pages.
	- All Reports: This will show a list of all the reports saved to the Database, grouped by project and then sorted by the work date of the report. For each report item basic summary info is shown including the date, who submitted it, and the description of the work completed for the day.
	- All Users: As this app is geared towards small contractors, an all users page is included to see a list of every user within the company. This page shows basic summary info for each user, and can select one to then see all of thier info and reports they have submitted. 
	- All Projects: This page will display a list of all active projects within the database. Similar to the other pages, this shows teh summary info and then can select a project to fiew detailed info and all reports submitted to that project.

The 'New Report' page includes a form that autofills the current date, contains form fields for the various information needed, and includes validation to ensure that a user fills out all required fields. (every field except 'Deliveries' and 'Inspections' are required as these would always apply on a jobsite.) The user can select which project to assign the report, this list is updated as new projects are created and a selection must be made to submit the form.

The app includes two layers of validation for user entries. The first layer is within the front end HTML. Each form uses a 'required' tag on the form inputs and wont let a user submit without completing all required fields. The second layer of validation is on the back end, using the Active Record validate method within each model to ensure that the 'params' hash submitted includes all required keys prior to saving or creating a record. If the user is able to submit the form with bad info, this will catch it and redirect the page back to the form with an error message to the user.

# Install Instruction
To install this app, simply follow these few steps:
	1. Fork and download the repository
	2. Open the package in your favorite IDE
	3. Run the command: $ bundle install to install all required gems
	4. (optional) Use the $rake db:reseed command to reset the database and load some sample data 
	5. Start a local server using the shotgun gem: $ shotgun 
	6. From your brower, navigate to the local address shown in the prompt.
	7. For the first use, create a user account and log in to begin using the app.

 # User Instructions
Creating a user account:
	1. Login or create an account to access the home page.
Submitting a report:
	1. From the home page, click the journal icon to create a new report for an existing project.
	2. To submit a report, fill out all of the required fields, select a project, and click on 'submit'
Viewing items:
	1. To view all the saved reports, select 'All Reports' at the top of the page. Then select a report to view in more detail if desired.
	2. To view all of the reports on a project, click on the 'All Projects' and then select a project from the list.
	3. To view a list of users and the reports they have submitted, select 'All Users' and then select a user to view.
Editing Items:
	1. To edit a daily report, navigate to that reports details page and select 'Edit Report' (Note: you may only edit or delete reports you have authored.)
	2. To edit a projects details, navigate to the project details page, select 'Edit Project', make your modifications, and then select 'Save Project'. 
	3. To edit your user info, navigate to your user detail page, select 'Edit User Details', make your changes and then select 'Update User' to save the changes. (Note: You may only edit your own details and not other users) 

# License
MIT open source license, Copyright 2021 Cameron Kingsley

# Contributing
If you notice a problem with the program that you believe needs improvement
but you're unable to make the change yourself, you should raise a Github issue
containing a clear description of the problem.

If you see an opportunity for improvement and can make the change yourself go
ahead and use a typical git workflow to make it happen:

* Fork this program's repository
* Make the change on your fork, with descriptive commits in the standard format
* Open a Pull Request against this repo

The changes will be reviewed and approved or commented in due course.
