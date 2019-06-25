# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

subregions_list = [
	{
		english: "Caribbean",
		french: "Caraïbes"
	},
	{
		english: "Central America",
		french: "Amérique centrale"
	},
	{
		english: "North America",
		french: "Amérique du Nord"
	},
	{
		english: "South America",
		french: "Amérique du Sud"
	},
	{
		english: "Central Asia",
		french: "Asie centrale"
	},
	{
		english: "East Asia",
		french: "Extrême-Orient"
	},
	{
		english: "South Asia",
		french: "Asie du Sud"
	},
	{
		english: "South-East Asia",
		french: "Asie du Sud-Est"
	},
	{
		english: "Eastern Europe",
		french: "Europe de l'Est"
	},
	{
		english: "Northern Europe",
		french: "Europe du Nord"
	},
	{
		english: "Southern Europe",
		french: "Europe du Sud"
	},
	{
		english: "Western Europe",
		french: "Europe de l'Ouest"
	},
	{
		english: "Middle East",
		french: "Moyen-Orient"
	},
	{
		english: "North Africa",
		french: "Afrique du Nord"
	},
	{
		english: "Australia and New Zealand",
		french: "Australie et Nouvelle-Zélande"
	},
	{
		english: "Melanesia",
		french: "Mélanésie"
	},
	{
		english: "Micronesia",
		french: "Micronésie"
	},
	{
		english: "Polynesia",
		french: "Polynésie"
	},
	{
		english: "Central Africa",
		french: "Afrique centrale"
	},
	{
		english: "East Africa",
		french: "Afrique orientale"
	},
	{
		english: "Southern Africa",
		french: "Afrique du Sud"
	},
	{
		english: "West Africa",
		french: "Afrique occidentale"
	}
]

# Function to only add unique values
subregions_list.each do |s|
	Region.find_or_create_by(english: s[:english], french: s[:french] )
end








