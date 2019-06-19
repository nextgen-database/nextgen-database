# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

sectors_list = [
	{
		english: "Accountability",
		french: "Reddition de comptes"
	},
	{
		english: "Activism",
		french: "Activisme"
	},
	{
		english: "Agricultural education/training",
		french: "Formation ou enseignement agricole"
	},
	{
		english: "Agricultural policy",
		french: "Politiques agricoles"
	},
	{
		english: "Agriculture",
		french: "Agriculture"
	},
	{
		english: "Aid",
		french: "Aide au développement"
	},
	{
		english: "Aid effectiveness",
		french: "Efficacité de l’aide"
	},
	{
		english: "Biodiversity",
		french: "Biodiversité"
	},
	{
		english: "Canadian policy",
		french: "Politiques canadiennes"
	},
	{
		english: "Capacity building",
		french: "Renforcement des capacités"
	},
	{
		english: "Children's rights, including child protection",
		french: "Droits de l'enfant (y compris la protection de l'enfant)"
	}
]

# Function to only add unique values
sectors_list.each do |s|
	Sector.find_or_create_by(english: s[:english], french: s[:french] )
end
