# Generate Users
cameron = User.create(first_name: "Cameron", last_name: "Kingsley", username: "kingsley113", password: "12345", email: "cameron@mail.com", position: "Owner")
jimmy = User.create(first_name: "Jimmy", last_name: "Diresta", username: "jDiresta", password: "12345", email: "jimmy@mail.com", position: "Superintendent")
bob = User.create(first_name: "Bob", last_name: "Clagett", username: "bClagett", password: "12345", email: "bob@mail.com", position: "Foreman")
david = User.create(first_name: "David", last_name: "Piccutio", username: "dPiccutio", password: "12345", email: "david@mail.com", position: "Project Manager")
thomas = User.create(first_name: "Thomas", last_name: "Brush", username: "tBrush", password: "12345", email: "thomas@mail.com", position: "Superintendent")


# Generate Projects
@skyline = Project.create(name: "Skyline Tower", address: "345 Hammond Way", scheduled_duration: "45 Weeks",	start_date: "2021-06-25", finish_date: "2022-03-31") 
skyline_users = ["1", "2", "3"]
skyline_users.each do |user|
	@skyline.users << User.find(user)
end		

@flatiron = Project.create(name: "Flatiron Building", address: "136 Smith Ave", scheduled_duration: "85 Weeks",	start_date: "2021-06-25", finish_date: "2022-12-21") 
flatiron_users = ["1", "2", "3", "5"]
flatiron_users.each do |user|
	@flatiron.users << User.find(user)
end	

@needle = Project.create(name: "Space Needle", address: "25 Worlds Fair Drive", scheduled_duration: "30 Weeks",	start_date: "2021-07-13", finish_date: "2022-02-15") 
needle_users = ["1", "2", "4", "5"]
needle_users.each do |user|
	@needle.users << User.find(user)
end	

@troll = Project.create(name: "Fremont Troll", address: "9643 Stone Way", scheduled_duration: "10 Weeks",	start_date: "2021-05-25", finish_date: "2021-08-23") 
troll_users = ["2", "3"]
troll_users.each do |user|
	@troll.users << User.find(user)
end	


# Generate Daily Reports
daily1 = DailyReport.create( 
	work_date: "2021-06-25",
	no_of_workers_onsite: "10",
	shift_start_time: "06:30",
	shift_end_time: "14:30",
	work_completed: "Structural Steel, poured concrete, safety meeting",
	weather: "Hot and Sunny 85 deg",
	deliveries: "Structural steel",
	inspections: "Concrete inspection",
	user_id: "1",
	project_id: "1"
)


daily2 = DailyReport.create( 
	work_date: "2021-06-24",
	no_of_workers_onsite: "8",
	shift_start_time: "06:30",
	shift_end_time: "15:30",
	work_completed: "Structural Steel, weekly meeting, stripped forms",
	weather: "cloudy 65 deg",
	deliveries: "Structural steel",
	inspections: "steel inspection",
	user_id: "2",
	project_id: "2"
)

daily3 = DailyReport.create( 
	work_date: "2021-06-23",
	no_of_workers_onsite: "15",
	shift_start_time: "06:00",
	shift_end_time: "15:00",
	work_completed: "Structural Steel, formwork",
	weather: "Sunny 80 deg",
	deliveries: "concrete forms",
	inspections: "none today",
	user_id: "4",
	project_id: "1"
)

daily4 = DailyReport.create( 
	work_date: "2021-06-25",
	no_of_workers_onsite: "24",
	shift_start_time: "06:30",
	shift_end_time: "15:30",
	work_completed: "Poured concrete, meetings",
	weather: "raining, cold",
	deliveries: "concrete",
	inspections: "Concrete inspection",
	user_id: "5",
	project_id: "3"
)

daily5 = DailyReport.create( 
	work_date: "2021-06-24",
	no_of_workers_onsite: "3",
	shift_start_time: "05:30",
	shift_end_time: "13:30",
	work_completed: "flooring, painting",
	weather: "Everything is on fire hot",
	deliveries: "paint and flooring",
	inspections: "insulation inspection",
	user_id: "3",
	project_id: "1"
)

daily6 = DailyReport.create( 
	work_date: "2021-06-22",
	no_of_workers_onsite: "13",
	shift_start_time: "06:30",
	shift_end_time: "14:30",
	work_completed: "sculpt the trolls face",
	weather: "Sunny 75 deg",
	deliveries: "plaster",
	inspections: "none today",
	user_id: "3",
	project_id: "4"
)

daily7 = DailyReport.create( 
	work_date: "2021-06-22",
	no_of_workers_onsite: "24",
	shift_start_time: "06:30",
	shift_end_time: "14:30",
	work_completed: "excavation, more unproductive meetings",
	weather: "Warm and Sunny 75 deg",
	deliveries: "soil fill",
	inspections: "survey",
	user_id: "4",
	project_id: "3"
)

daily8 = DailyReport.create( 
	work_date: "2021-06-23",
	no_of_workers_onsite: "19",
	shift_start_time: "06:30",
	shift_end_time: "14:30",
	work_completed: "glazing and insulation",
	weather: "Hot and Sunny 85 deg",
	deliveries: "windows",
	inspections: "insulation and wall cover inspections",
	user_id: "1",
	project_id: "3"
)