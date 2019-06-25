# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

regions_list = [
	{
		english: "Americas",
		french: "Amériques"
	},
	{
		english: "Antarctica",
		french: "Antarctique"
	},
	{
		english: "Asia",
		french: "Asie",
	},
	{
		english: "Europe",
		french: "Europe"
	},
	{
		english: "Middle East and North Africa",
		french: "Moyen-Orient et Afrique du Nord"
	},
	{
		english: "Oceania",
		french: "Océanie"
	},
	{
		english: "Sub-Saharan Africa",
		french: "Afrique subsaharienne"
	}
]

# Function to only add unique values
regions_list.each do |s|
	Region.find_or_create_by(english: s[:english], french: s[:french] )
end








