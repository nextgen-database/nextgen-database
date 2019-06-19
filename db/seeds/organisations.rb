# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

organisations_list = [
	{
		english: "Acadia University",
		french: "Acadia University"
	},
	{
		english: "Athabasca University",
		french: "Athabasca University"
	},
	{
		english: "Concordia University",
		french: "Concordia University"
	},
	{
		english: "Dalhousie University",
		french: "Dalhousie University"
	},
	{
		english: "McGill University",
		french: "McGill University"
	}
]

# Function to only add unique values
organisations_list.each do |s|
	Organisation.find_or_create_by(english: s[:english], french: s[:french] )
end
