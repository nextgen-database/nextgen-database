# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

demographic_list = [
	{
		english: "Adolescent girls or boys",
		french: "Adolescents ou adolescentes"
	},
	{
		english: "Aging populations",
		french: "Populations vieillissantes"
	},
	{
		english: "Boys",
		french: "Garçons"
	},
	{
		english: "Canadian First Nations",
		french: "Premières Nations du Canada"
	},
	{
		english: "Children",
		french: "Enfants"
	},
	{
		english: "Diaspora",
		french: "Diasporas"
	},
	{
		english: "Entrepreneurs",
		french: "Entrepreneurs"
	},
	{
		english: "Farmers/farm workers/agrarian populations",
		french: "Fermiers, travailleurs agricoles ou populations agricoles"
	},
	{
		english: "Fishers",
		french: "Pêcheurs"
	},
	{
		english: "Girls",
		french: "Filles"
	},
	{
		english: "Immigrants",
		french: "Immigrants"
	},
	{
		english: "Indigenous populations",
		french: "Peuples autochtones"
	},
	{
		english: "Internally displaced populations/persons",
		french: "Peuples ou gens déplacés à l'intérieur de leur propre pays"
	},
	{
		english: "Landowners",
		french: "Propriétaires fonciers"
	},
	{
		english: "LGBTQ",
		french: "Communauté LGBTQ"
	},
	{
		english: "Local populations",
		french: "Populations locales"
	},
	{
		english: "Marginalized populations",
		french: "Peuples marginalisés"
	},
	{
		english: "Migrants",
		french: "Migrants"
	},
	{
		english: "Minorities",
		french: "Minorités"
	},
	{
		english: "Nomadic groups",
		french: "Groupes nomades"
	},
	{
		english: "Pastoralists",
		french: "Pasteurs"
	},
	{
		english: "Peasants",
		french: "Paysans"
	},
	{
		english: "People with disabilities",
		french: "Personnes handicapées"
	},
	{
		english: "People living with HIV/AIDS",
		french: "Personnes vivant avec le VIH/sida"
	},
	{
		english: "Refugees",
		french: "Réfugiés"
	},
	{
		english: "Rural populations",
		french: "Populations rurales"
	},
	{
		english: "Students",
		french: "Étudiants"
	},
	{
		english: "Urban populations",
		french: "Populations urbaines"
	},
	{
		english: "Women",
		french: "Femmes"
	},
	{
		english: "Labourers/Workers",
		french: "Ouvriers / Travailleurs"
	},
	{
		english: "Youth",
		french: "Jeunes"
	}
]




# Function to only add unique values
demographic_list.each do |s|
	Demographic.find_or_create_by(english: s[:english], french: s[:french] )
end
