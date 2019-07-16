# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

developent_actors_list = [
	{
		english: "Activists",
		french: "Militants"
	},
	{
		english: "Bilateral donors",
		french: "Bailleurs de fonds bilatéraux"
	},
	{
		english: "Broadcasters",
		french: "Diffuseurs"
	},
	{
		english: "Citizen groups",
		french: "Groupes citoyens"
	},
	{
		english: "Civil society organizations",
		french: "Organisations de la société civile"
	},
	{
		english: "Conflict-affected states",
		french: "États touchés par un conflit"
	},
	{
		english: "Cooperatives",
		french: "Coopératives"
	},
	{
		english: "Corporations",
		french: "Entreprises"
	},
	{
		english: "Development finance institutions",
		french: "Institutions financières de développement"
	},
	{
		english: "Emerging economies",
		french: "Économies émergentes"
	},
	{
		english: "Foundations",
		french: "Fondations"
	},
	{
		english: "Fragile states",
		french: "États fragiles"
	},
	{
		english: "Government institutions (bilateral)",
		french: "Institutions gouvernementales bilatérales"
	},
	{
		english: "Government institutions (multilateral)",
		french: "Institutions gouvernementales multilatérales"
	},
	{
		english: "High-income countries",
		french: "Pays riches"
	},
	{
		english: "Industry",
		french: "Industries"
	},
	{
		english: "International institutions",
		french: "Institutions internationales"
	},
	{
		english: "Labour unions",
		french: "Syndicats"
	},
	{
		english: "Least-developed countries",
		french: "Pays les moins avancés"
	},
	{
		english: "Local government",
		french: "Gouvernements locaux"
	},
	{
		english: "Low-income countries",
		french: "Pays à faible revenu"
	},
	{
		english: "Military",
		french: "Armée"
	},
	{
		english: "Multilateral development banks",
		french: "Banques multilatérales de développement"
	},
	{
		english: "Multinational/transnational corporations",
    	french: "Multinationales",
	},
	{
		english: "Non-governmental organizations",
		french: "Organisations non gouvernementales"
	},
	{
		english: "Micro, small and medium-sized enterprises",
		french: "Micro, petites et moyennes entreprises"
	},
	{
		english: "Middle-income countries",
		french: "Pays à revenu moyen"
	},
	{
		english: "Parliamentarians",
		french: "Parlementaires"
	},
	{
		english: "Policy-makers",
		french: "Décideurs"
	},
	{
		english: "Private sector actors",
		french: "Acteurs du secteur privé"
	},
	{
		english: "Small and medium-sized organizations",
		french: "Petites et moyennes organisations"
	},
	{
		english: "Small island developing states",
		french: "Petits États insulaires en développement"
	},
	{
		english: "Social enterprises",
		french: "Entreprises sociales"
	},
	{
		english: "Social movements",
		french: "Mouvements sociaux"
	},
	{
		english: "United Nations",
		french: "Nations Unies"
	},
	{
		english: "United Nations Development Group",
		french: "Groupe des Nations Unies pour le développement"
	},
	{
		english: "Women’s rights organizations",
		french: "Organisations de défense des droits des femmes"
	},
	{
		english: "Government institutions (regional)",
		french: "Institutions gouvernementales régionales"
    }
]
# Function to only add unique values
developent_actors_list.each do |s|
	DevelopmentActor.find_or_create_by(english: s[:english], french: s[:french] )
end
