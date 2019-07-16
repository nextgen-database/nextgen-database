# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

research_methods_list = [
	{
		english: "Action-research",
        french: "Recherche-action"
	},
	{
		english: "Agronomics",
        french: "Recherche agronomique"
	},
    {
		english: "Anthropological approach",
        french: "Approche anthropologique"
	},
    {
		english: "Applied research",
        french: "Recherche appliquée"
	},
    {
		english: "Case studies",
        french: "Étude de cas"
	},
    {
		english: "Comparative Analysis",
        french: "Analyse comparative"
	},
    {
		english: "Comparative Studies",
        french:  "Étude comparative"
	},
    {
		english: "Discourse analysis",
		french:  "Analyse du discours"
	},
    {
		english: "Econometrics",
		french:  "Économétrie"
	},{
		english: "Ethnography",
		french:  "Ethnographie"
	},
	{
		english: "Grounded-theory",
		french:  "Théorie à base empirique"
	},
    {
		english: "Historical research",
		french:  "Recherche historique"
	},
    {
		english: "Mixed-methods",
		french:  "Approche mixte"
	},
    {
		english: "Oral History",
		french:  "Histoire orale"
	},{
		english: "Participatory approach",
		french:  "Approche participative"
	},
    {
		english: "Practical Research",
		french:  "Recherche sur le terrain"
	},
    {
		english: "Qualitative",
		french:  "Étude qualitative"
	},
    {
		english: "Quantitative",
		french:  "Étude quantitative"
	},
    {
		english: "Regression analysis",
		french:  "Analyse de régression"
	},
	{
		english: "Results-based management",
		french:  "Gestion axée sur les résultats"
	},
    {
		english: "Theoretical Research",
		french:  "Recherche théorique"
	},
    {
		english: "Theory of change",
		french:  "Théorie du changement"
	}
]


# Function to only add unique values
research_methods_list.each do |s|
	ResearchMethod.find_or_create_by(english: s[:english], french: s[:french] )
end
