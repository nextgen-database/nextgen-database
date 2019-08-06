# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

organisation_type_list = [
	{
		english: "Civil Society Organization",
		french:  "Organisation de la société civile"
	},
	{
		english: "Coalition",
		french: "Coalition"
	},
	{
		english: "College",
		french: "Collège"
	},
	{
		english: "Network",
		french: "Réseau"
	},
	{
		english: "School",
		french: "École"
	},
	{
		english: "University",
		french: "Université"
	},
	{
		english: "Research Centre",
		french: "Centre de recherche"
	},
	{
		english: "Think Tank",
		french: "Groupe de réflexion"
	},
	{
		english: "Research Funding Agency",
		french: "Research Funding Agency"
	}
]

# Function to only add unique values
organisation_type_list.each do |s|
	OrganisationType.find_or_create_by(english: s[:english], french: s[:french] )
end
