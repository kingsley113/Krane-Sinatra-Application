# Generate Users
cameron = User.create(first_name: "Cameron", last_name: "Kingsley", username: "kingsley113", password: "12345", email: "cameron@mail.com", position: "Owner")
jimmy = User.create(first_name: "Jimmy", last_name: "Diresta", username: "jDiresta", password: "12345", email: "jimmy@mail.com", position: "Superintendent")
bob = User.create(first_name: "Bob", last_name: "Clagett", username: "bClagett", password: "12345", email: "bob@mail.com", position: "Foreman")
david = User.create(first_name: "David", last_name: "Piccutio", username: "dPiccutio", password: "12345", email: "david@mail.com", position: "Project Manager")
thomas = User.create(first_name: "Thomas", last_name: "Brush", username: "tBrush", password: "12345", email: "thomas@mail.com", position: "Superintendent")

# Generate Projects
@skyline = Project.create(name: "Skyline Tower", address: "345 Hammond Way", scheduled_duration: "45 Weeks",	start_date: "2021-06-25", finish_date: "2022-03-31") 
skyline_users = ["1", "2", "4"]
skyline_users.each do |user|
	@skyline.users << User.find(user)
end		

@flatiron = Project.create(name: "Flatiron Building", address: "136 Smith Ave", scheduled_duration: "85 Weeks",	start_date: "2021-06-25", finish_date: "2022-12-21") 
flatiron_users = ["1", "3", "5"]
flatiron_users.each do |user|
	@flatiron.users << User.find(user)
end	

@needle = Project.create(name: "Space Needle", address: "25 Worlds Fair Drive", scheduled_duration: "30 Weeks",	start_date: "2021-07-13", finish_date: "2022-02-15") 
needle_users = ["1", "2", "3", "4"]
needle_users.each do |user|
	@needle.users << User.find(user)
end	

@troll = Project.create(name: "Fremont Troll", address: "9643 Stone Way", scheduled_duration: "10 Weeks",	start_date: "2021-05-25", finish_date: "2021-08-23") 
troll_users = ["2", "5"]
troll_users.each do |user|
	@troll.users << User.find(user)
end	