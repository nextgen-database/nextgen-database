# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

titles_list = [
	{
		english: "Academic Coordinator",
		french: "Coordonnateur ou coordonnatrice des études"
	},
	{
		english: "Academic Coordinator",
		french: "Coordonnateur ou coordonnatrice des études"
	},
	{
		english: "Academic Coordinator",
		french: "Coordonnateur ou coordonnatrice des études"
	},
	{
		english: "Adjunct Professor",
		french: "Professeur auxiliaire ou professeure auxiliaire"
	},
	{
		english: "Advisory Board Member",
		french: "Membre du conseil consultatif"
	},
	{
		english: "Affiliate Member",
		french: "Membre affilié ou membre affiliée"
	},
	{
		english: "Affiliate Scientist",
		french: "Scientifique affilié ou scientifique affiliée"
	},
	{
		english: "Assistant Dean",
		french: "Vice-doyen ou vice-doyenne"
	},
	{
		english: "Associate Dean",
		french: "Doyen associé ou doyenne associée"
	},
	{
		english: "Associate Director",
		french: "Directeur associé ou directrice associée"
	},
	{
		english: "Associate Editor",
		french: "Rédacteur en chef adjoint ou rédactrice en chef adjointe"
	},
	{
		english: "Associated Faculty",
		french: "Faculté associée"
	}
]


# Function to only add unique values
titles_list.each do |s|
	Title.find_or_create_by(english: s[:english], french: s[:french] )
end
