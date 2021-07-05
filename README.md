# Krane-Sinatra-Application
 Krane Daily Report App - Phase 2 Final Project

##Description
 Krane is a simple daily report app aimed at general contractors in the construction industry. The intent is to simplify submitting and saving many reports submitted by multiple users on multiple projects. From my background in the construction industry this is one of the areas that is often overlooked as it is typically a mundane, time consuming task, but very important to have records of construction progress.

 This app uses the Active Record framework to set up and maintain the database and relationship between models. An outline of the relationships is as follows:
	- A User can be assigned to many Projects 
	- A User can submit (and therefore have many) Daily Reports
	- A Project can be assigned to multiple Users
	- A Project will have many Daily Reports 
	- A Daily Report will belong to only one User
	- A Daily Report will belong to only one Project

##Install Instruction
To install this app, simply follow these few steps:
	1. Fork and download the repository
	2. Open the package in your favorite IDE
	3. Run the command: $ bundle install
	4. After all gems are installed, you can start a local server using the shotgun gem: $ shotgun
	5. Navigate to the address shown in the promp and enjoy the app!

##Contributing

##License
	Standard MIT License

 
