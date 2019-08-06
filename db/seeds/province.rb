# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

province_list = [
	{
		english: "Alberta",
		french:  "Alberta"
	},
	{
		english: "British Columbia",
		french:  "Colombie-Britannique"
	},
	{
		english: "Manitoba",
		french:  "Manitoba"
	},
	{
		english: "New Brunswick",
		french: "Nouveau-Brunswick"
	},
	{
		english: "Newfoundland and Labrador",
		french: "Terre-Neuve-et-Labrador"
	},
	{
		english: "Northwest Territories",
		french: "Territoires du Nord-Ouest"
	},
	{
		english: "Nova Scotia",
		french: "Nouvelle-Écosse"
	},
	{
		english: "Nunavut",
		french: "Nunavut"
	},
	{
		english: "Ontario",
		french: "Ontario"
	},
	{
		english: "Prince Edward Island",
		french: "Île-du-Prince-Édouard"
	},
	{
		english: "Quebec",
		french: "Québec"
	},
	{
		english: "Saskatchewan",
		french: "Saskatchewan"
	},
	{
		english: "Yukon",
		french: "Yukon"
	}
]

# Function to only add unique values
province_list.each do |s|
	Province.find_or_create_by(english: s[:english], french: s[:french] )
end
