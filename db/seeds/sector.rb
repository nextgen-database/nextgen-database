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
	},
	{
		english: "Citizenship",
		french: "Citoyenneté"
	},
	{
		english: "Clean technology",
		french: "Technologies propres"
	},
	{
		english: "Climate change",
    	french: "Changements climatiques"
	},
	{
		english: "Climate finance",
		french: "Financement de la lutte contre les changements climatiques"
	},
	{
		english: "Community development",
    	french: "Développement communautaire"
	},
	{
		english: "Conflict",
    	french: "Conflits"
	},
	{
		english: "Conflict prevention",
		french: "Prévention des conflits"
	},
	{
		english: "Conflict resolution",
    	french: "Résolution des conflits"
    },
	{
		english: "Colonialism",
		french: "Colonialisme"
	},
	{
		english: "Conservation",
    	french: "Conservation"
    },
	{
		english: "Consumption and production",
    	french: "Consommation et production"
    },
	{
		english: "Corporate accountability",
    	french: "Reddition de comptes des entreprises"
    },
	{
		english: "Corporate social responsibility",
    	french: "Responsabilité sociale des entreprises"
    },
	{
		english: "Critical studies",
    	french: "Études critiques"
    },
	{
		english: "Culture",
    	french: "Culture"
    },
	{
		english: "Data",
    	french: "Données"
    },
	{
		english: "Debt cancellation and debt relief",
    	french: "Annulation et allégement de dettes"
    },
	{
		english: "Decentralization",
    	french: "Décentralisation"
    },
	{
		english: "Democracy",
    	french: "Démocratie"
    },
	{
		english: "Democratic participation",
    	french: "Participation démocratique"
    },
	{
		english: "Development economics",
    	french: "Économie du développement"
    },
	{
		english: "Development education",
    	french: "Éducation pour le développement"
    },
	{
		english: "Development effectiveness",
    	french: "Efficacité du développement"
    },
	{
		english: "Development financing",
    	french: "Financement du développement"
    },
	{
		english: "Dictatorships",
    	french: "Dictatures"
    },
	{
		english: "Disability",
    	french: "Personnes handicapées"
    },
	{
		english: "Disarmament",
    	french: "Désarmement"
    },
	{
		english: "Disaster risk reduction",
    	french: "Réduction des risques de catastrophe"
    },
	{
		english: "Displacement",
    	french: "Déplacements de populations"
    },
	{
		english: "Economic development",
    	french: "Développement économique"
    },
	{
		english: "Economic growth",
    	french: "Croissance économique"
    },
	{
		english: "Economics",
    	french: "Économie"
    },
	{
		english: "Ecosystems",
    	french: "Écosystèmes"
    },
	{
		english: "Education",
    	french: "Éducation"
    },
	{
		english: "Education policy",
    	french: "Politiques en matière d'éducation"
    },
	{
		english: "Elections",
    	french: "Élections"
    },
	{
		english: "Emergency preparedness",
    	french: "Préparation aux situations d'urgence"
    },
	{
		english: "Employment",
    	french: "Emplois"
    },
	{
		english: "Empowerment",
    	french: "Autonomisation"
    },
	{
		english: "Energy",
    	french: "Énergie"
    },
	{
		english: "Environment",
    	french: "Environnement"
    },
	{
		english: "Environmental assessment",
    	french: "Évaluations environnementales"
    },
	{
		english: "Environmental policy",
    	french: "Politiques environnementales"
    },
	{
		english: "Environmental protection",
    	french: "Protection de l'environnement"
    },
	{
		english: "Ethics",
    	french: "Éthique"
    },
	{
		english: "Ethnicity",
    	french: "Appartenance ethnique"
    },
	{
		english: "Evaluation",
    	french: "Évaluation"
    },
	{
		english: "Extractive industries",
    	french: "Industries extractives"
    },
	{
		english: "Female genital mutilation",
    	french: "Mutilation génitale féminine"
    },
	{
		english: "Feminism",
    	french: "Féminisme"
    },
	{
		english: "Financial inclusion",
    	french: "Inclusion financière"
    },
	{
		english: "Financial services",
    	french: "Services financiers"
    },
	{
		english: "Financial system",
    	french: "Système financier"
    },
	{
		english: "Fishing/fisheries",
    	french: "Pêche/pêcheries"
    },
	{
		english: "Food security",
    	french: "Sécurité alimentaire"
    },
	{
		english: "Food sovereignty",
    	french: "Souveraineté alimentaire"
    },
	{
		english: "Forced migration",
    	french: "Migration forcée"
    },
	{
		english: "Forestry",
    	french: "Foresterie"
    },
	{
		english: "Gender",
    	french: "Genres"
    },
	{
		english: "Gender equality",
    	french: "Égalité entre les sexes"
    },
	{
		english: "Gender-based violence",
    	french: "Violence fondée sur le sexe"
    },
	{
		english: "Global citizenship",
    	french: "Citoyenneté mondiale"
    },
	{
		english: "Global governance",
    	french: "Gouvernance mondiale"
    },
	{
		english: "Globalization",
    	french: "Mondialisation"
    },
	{
		english: "Governance",
    	french: "Gouvernance"
    },
	{
		english: "Health",
    	french: "Santé"
    },
	{
		english: "Health policy",
    	french: "Politiques en matière de santé"
    },
	{
		english: "Health, reproductive",
    	french: "Santé reproductive"
    },
	{
		english: "History",
    	french: "Histoire"
    },
	{
		english: "HIV/AIDS",
    	french: "VIH/sida"
    },
	{
		english: "Human rights",
    	french: "Droits de la personne"
    },
	{
		english: "Human security",
    	french: "Sécurité humaine"
    },
	{
		english: "Humanitarian assistance",
    	french: "Aide humanitaire"
    },
	{
		english: "Humanitarian law",
    	french: "Droit humanitaire"
    },
	{
		english: "Inclusion",
    	french: "Inclusion"
    },
	{
		english: "Income",
    	french: "Revenu"
    },
	{
		english: "Indigenous rights",
    	french: "Droits des peuples autochtones"
    },
	{
		english: "Industrial policy",
    	french: "Politiques de l'industrie"
    },
	{
		english: "Inequality",
    	french: "Inégalités"
    },
	{
		english: "Information and Communication Technologies",
    	french: "Technologies de l'information et des communications"
    },
	{
		english: "Infrastructure",
    	french: "Infrastructures"
    },
	{
		english: "Innovation",
    	french: "Innovation"
    },
	{
		english: "International finance",
    	french: "Finances internationales"
    },
	{
		english: "International law",
    	french: "Droit international"
    },
	{
		english: "Judicial systems",
    	french: "Systèmes judiciaires"
    },
	{
		english: "Justice",
    	french: "Justice"
    },
	{
		english: "Knowledge and learning",
    	french: "Connaissances et apprentissage"
    },
	{
		english: "Labour rights",
    	french: "Droits des travailleurs"
    },
	{
		english: "Land grabbing",
    	french: "Accaparement de terres"
    },
	{
		english: "Land reform",
    	french: "Réforme agraire"
    },
	{
		english: "Law",
    	french: "Droit"
    },
	{
		english: "Legal reform",
    	french: "Réforme juridique"
    },
	{
		english: "LGBTQ issues",
    	french: "Communauté LGBTQ"
    },
	{
		english: "Livelihood",
    	french: "Moyens de subsistance"
    },
	{
		english: "Marine systems",
    	french: "Systèmes marins"
    },
	{
		english: "Markets",
    	french: "Marchés"
    },
	{
		english: "Maternal, newborn, and child health",
    	french: "Santé des mères, des nouveau-nés et des enfants"
    },
	{
		english: "Microfinance and microcredit",
    	french: "Microfinance et microcrédit"
    },
	{
		english: "Migration",
    	french: "Migration"
    },
	{
		english: "Mining",
    	french: "Exploitation minière"
    },
	{
		english: "Multi-stakeholder partnership",
    	french: "Partenariats multipartites"
    },
	{
		english: "Nationalism",
    	french: "Nationalisme"
    },
	{
		english: "Natural resource management",
    	french: "Gestion des ressources naturelles"
    },
	{
		english: "Nutrition",
    	french: "Nutrition"
    },
	{
		english: "Oceans",
    	french: "Océans"
    },
	{
		english: "Official development assistance",
    	french: "Aide publique au développement"
    },
	{
		english: "Participation",
    	french: "Participation"
    },
	{
		english: "Partnership",
    	french: "Partenariats"
    },
	{
		english: "Peace and security",
    	french: "Paix et sécurité"
    },
	{
		english: "Peacebuilding",
    	french: "Consolidation de la paix"
    },
	{
		english: "Peacekeeping",
    	french: "Maintien de la paix"
    },
	{
		english: "Policy",
    	french: "Politiques"
    },
	{
		english: "Policy analysis",
    	french: "Analyse de politiques"
    },
	{
		english: "Political economy",
    	french: "Économie politique"
    },
	{
		english: "Politics",
    	french: "Politique"
    },
	{
		english: "Population policy",
    	french: "Politiques démographiques"
    },
	{
		english: "Postcolonialism",
    	french: "Postcolonialisme"
    },
	{
		english: "Poverty reduction",
    	french: "Réduction de la pauvreté"
    },
	{
		english: "Power",
    	french: "Pouvoir"
    },
	{
		english: "Project management",
    	french: "Gestion de projets"
    },
	{
		english: "Public engagement",
    	french: "Engagement du public"
    },
	{
		english: "Public sector policy",
    	french: "Politiques relatives au secteur public"
    },
	{
		english: "Public-private partnerships",
    	french: "Partenariats public-privé"
    },
	{
		english: "Race",
    	french: "Race"
    },
	{
		english: "Reconstruction (Humanitarian)",
    	french: "Reconstruction (aide humanitaire)"
    },
	{
		english: "Regional",
    	french: "Enjeux locaux"
    },
	{
		english: "Religion and development",
    	french: "Religion et développement"
    },
	{
		english: "Renewable energy",
    	french: "Énergies renouvelables"
    },
	{
		english: "Resilience",
    	french: "Résilience"
    },
	{
		english: "Results-based management",
    	french: "Gestion axée sur les résultats"
    },
	{
		english: "Rural development",
    	french: "Développement rural"
    },
	{
		english: "Sanitation and waste disposal",
    	french: "Élimination des déchets et assainissement"
    },
	{
		english: "Sexual and reproductive health and rights",
    	french: "Santé et droits reproductifs et sexuels"
    },
	{
		english: "Shelter and housing",
    	french: "Refuges et logement"
    },
	{
		english: "Small and medium-sized enterprises (SME) development",
    	french: "Développement de petites et moyennes entreprises (PME)"
    },
	{
		english: "Social change",
    	french: "Changement social"
    },
	{
		english: "Social development",
    	french: "Développement social"
    },
	{
		english: "Social protection",
    	french: "Protection sociale"
    },
	{
		english: "Social/welfare services",
    	french: "Services sociaux (aide sociale)"
    },
	{
		english: "South-south cooperation",
    	french: "Coopération Sud-Sud"
    },
	{
		english: "Sustainable development",
    	french: "Développement durable"
    },
	{
		english: "Sustainable Development Goals",
    	french: "Objectifs de développement durable"
    },
	{
		english: "System change",
    	french: "Changement systémique"
    },
	{
		english: "Taxation",
    	french: "Imposition"
    },
	{
		english: "Technology",
    	french: "Technologie"
    },
	{
		english: "The state",
    	french: "État"
    },
	{
		english: "Trade",
    	french: "Commerce"
    },
	{
		english: "Transnationalism",
    	french: "Transnationalisme"
    },
	{
		english: "Transparency",
    	french: "Transparence"
    },
	{
		english: "Urbanization and urban development",
    	french: "Urbanisation et développement urbain"
    },
	{
		english: "Volunteerism",
    	french: "Bénévolat"
    },
	{
		english: "Water access and conservation",
    	french: "Accès à l'eau et conservation des eaux"
    },
	{
		english: "Water sanitation and hygiene",
    	french: "Eau, assainissement et hygiène"
    },
	{
		english: "Women's rights",
		french: "Droits des femmes"
	},
	{
		english: "Militarization",
    	french: "Militarisation"
  	}
]

# Function to only add unique values
sectors_list.each do |s|
	Sector.find_or_create_by(english: s[:english], french: s[:french] )
end
