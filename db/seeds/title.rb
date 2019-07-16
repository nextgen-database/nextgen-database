# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

titles_list = [
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
	},
	{
		english: "Associate Member",
		french: "Membre associé ou membre associée"
 	},
	{
		english: "Associate Professor",
		french: "Professeur agrégé ou professeure agrégée"
	},
	{
		english: "Assistant Professor",
		french: "Professeur adjoint ou professeure adjointe"
	},
	{
		english: "Associate Researcher",
		french: "Chercheur associé ou chercheuse associée"
	},
	{
		english: "Canada Research Chair",
		french: "Chaire de recherche canadienne"
	},
	{
		english: "Canada Research Chair (Tier 1)",
		french: "Chaire de recherche canadienne (niveau 1)"
	},
	{
		english: "Canada Research Chair (Tier 2)",
		french: "Chaire de recherche canadienne (niveau 2)"
	},
	{
		english: "Chair",
		french: "Président ou présidente"
	},
	{
		english: "Co-chair",
		french: "Coprésident ou coprésidente"
	},
	{
		english: "Co-chair and founder",
		french: "Coprésident et fondateur ou coprésidente et fondatrice"
	},
	{
		english: "Co-convener",
		french: "Coresponsable"
	},
	{
		english: "Co-founder",
		french: "Cofondateur ou cofondatrice"
	},
	{
		english: "Co-founder and Executive Board",
		french: "Cofondateur et membre du comité de direction ou cofondatrice et membre du comité de direction"
	},
	{
		english: "Continuing Adjunct",
		french: "Professeur auxiliaire permanent ou professeure auxiliaire permanente"
	},
	{
		english: "Coordinator",
		french: "Coordonnateur ou coordonnatrice"
	},
	{
		english: "Cross-Appointed Faculty",
		french: "Faculté nommée conjointement"
	},
	{
		english: "Cross Appointment",
		french: "Nomination conjointe"
	},
	{
		english: "Dean",
		french: "Doyen ou doyenne"
	},
	{
		english: "Department Chair",
		french: "Directeur ou directrice de département"
	},
	{
		english: "Department Head",
		french: "Responsable de département"
	},
	{
		english: "Director",
		french: "Directeur ou directrice"
	},
	{
		english: "Director of Graduate Studies",
		french: "Directeur ou directrice des études supérieures"
	},
	{
		english: "Director of Research",
		french: "Directeur ou directrice de recherche"
	},
	{
		english: "Doctoral Student",
		french: "Doctorant ou doctorante"
	},
	{
		english: "Editorial Board",
		french: "Comité de rédaction"
	},
	{
		english: "Editorial Review Board",
		french: "Comité de lecture"
	},
	{
		english: "Editor-in-Chief",
		french: "Rédacteur ou rédactrice en chef"
	},
	{
		english: "Executive Board Member",
		french: "Membre du comité de direction"
	},
	{
		english: "Executive Director",
		french: "Directeur exécutif ou directrice exécutive"
	},
	{
		english: "External Research Fellow",
		french: "Chercheur ou chercheuse universitaire externe"
	},
	{
		english: "Faculty Member",
		french: "Membre du corps enseignant"
	},
	{
		english: "Fellow",
		french: "Chercheur ou chercheuse"
	},
	{
		english: "Fellow and Non-Resident Fellow",
		french: "Chercheur non-résident ou chercheuse non-résidente"
	},
	{
		english: "Founding Director",
		french: "Directeur fondateur ou directrice fondatrice"
	},
	{
		english: "Founding Member",
		french: "Membre fondateur ou membre fondatrice"
	},
	{
		english: "Full Member",
		french: "Membre de plein droit"
	},
	{
		english: "Graduate Chair",
		french: "Responsable des études supérieures"
	},
	{
		english: "Graduate Coordinator",
		french: "Coordonnateur ou coordonnatrice des études supérieures"
	},
	{
		english: "Graduate Officer",
		french: "Agent ou agente des études supérieures"
	},
	{
		english: "Head",
		french: "Responsable"
	},
	{
		english: "Full Professor",
		french: "Professeur titulaire ou professeure titulaire"
	},
	{
		english: "Instructor",
		french: "Chargé ou chargée de cours"
	},
	{
		english: "International Relations Officer",
		french: "Agent ou agente des relations internationales"
	},
	{
		english: "Invited Professor",
		french: "Professeur invité ou professeure invitée"
	},
	{
		english: "Joint Appointment",
		french: "Nomination conjointe"
	},
	{
		english: "Lecturer",
		french: "Chargé ou chargée d'enseignement"
	},
	{
		english: "Management Committee Member",
		french: "Membre du comité de gestion"
	},
	{
		english: "Member",
		french: "Membre"
	},
	{
		english: "Non-Resident Research Fellow",
		french: "Chercheur universitaire non-résident ou chercheuse universitaire non-résidente"
	},
	{
		english: "Part-Time Professor",
		french: "Professeur à temps partiel ou professeure à temps partiel"
	},
	{
		english: "Postdoctoral Fellow",
		french: "Chercheur ou chercheuse postdoctoral"

	},
	{
		english: "President",
		french: "Président ou présidente"
	},
	{
		english: "Professor",
		french: "Professeur ou professeure"
	},
	{
		english: "Professor Emeritus/a",
		french: "Professeur émérite ou professeure émérite"
	},
	{
		english: "Professor of Practice",
		french: "Professeur praticien ou professeure praticienne"
	},
	{
		english: "Program Coordinator",
		french: "Coordonnateur ou coordonnatrice de programme"
	},
	{
		english: "Program Director",
		french: "Directeur ou directrice de programme"
	},
	{
		english: "Queen's National Scholar",
		french: "Boursier national de Queen's ou boursière nationale de Queen's"
	},
	{
		english: "Regular Teaching Faculty",
		french: "Faculté d'enseignement régulier"
	},
	{
		english: "Research Associate",
		french: "Associé ou associée de recherche"
	},
	{
		english: "Research Chair",
		french: "Chaire de recherche"
	},
	{
		english: "Research Fellow",
		french: "Chercheur ou chercheuse universitaire"
	},
	{
		english: "Researcher",
		french: "Chercheur ou chercheuse"
	},
	{
		english: "Retired Professor",
		french: "Professeur retraité ou professeure retraitée"
	},
	{
		english: "Scientific Director",
		french: "Directeur ou directrice scientifique"
	},
	{
		english: "Senator",
		french: "Sénateur ou sénatrice"
	},
	{
		english: "Senior Fellow",
		french: "Chercheur principal ou chercheuse principale"
	},
	{
		english: "Senior Lecturer",
		french: "Chargé d'enseignement principal ou chargée d'enseignement principale"
	},
	{
		english: "Senior Research Fellow",
		french: "Chercheur universitaire principal ou chercheuse universitaire principale"
	},
	{
		english: "Senior Visiting Research Fellow",
		french: "Chercheur universitaire principal invité ou chercheuse universitaire principale invitée"
	},
	{
		english: "Sessional Instructor",
		french: "Chargé ou chargée de cours à temps partiel"
	},
	{
		english: "Tutor",
		french: "Tuteur ou tutrice"
	},
	{
		english: "Undergraduate Advisor",
		french: "Conseiller ou conseillère au premier cycle"
	},
	{
		english: "Vice President",
		french: "Vice-président ou vice-présidente"
	},
	{
		english: "Visiting Professor",
		french: "Professeur invité ou professeure invitée"
	},
	{
		english: "Adjunct Research Professor",
		french: "Professeur auxiliaire ou professeure auxiliaire à la recherche"
	},
	{
		english: "Advisor",
		french: "Conseiller ou conseillère"
	},
	{
		english: "Associate Chair",
		french: "Titulaire associé"
	},
	{
		english: "Board Director",
		french: "Directeur ou directrice du Conseil d'administration "
	},
	{
		english: "Board Member ",
		french: "Membre du Conseil d'administration"
	},
	{
		english: "Chief Executive Officer (CEO)",
		french: "Président-Directeur général (PDG)"
	},
	{
		english: "Co-Director",
		french: "Codirecteur ou Codirectrice"
	},
	{
		english: "Consultant",
		french: "Consultant ou consultante"
	},
	{
		english: "Deputy Director",
		french: "Directeur adjoint ou directrice adjointe"
	},
	{
		english: "Executive Council Member",
		french: "Membre du comité exécutif"
	},
	{
		english: "Graduate Fellow",
		french: "Chercheur ou chercheuse aux études supérieures"
	},
	{
		english: "Head of Programs",
		french: "Chef des programmes"
	},
	{
		english: "Manager",
		french: "Gestionnaire"
	},
	{
		english: "PhD student",
		french: "Étudiant ou étudiante au doctorat"
	},
	{
		english: "PhD candidate",
		french: "Candidat ou candidate au doctorat"
	},
	{
		english: "Policy Analyst",
		french: "Analyste des politiques"
	},
	{
		english: "Principal",
		french: "Directeur  ou directrice "
	},
	{
		english: "Program Analyst",
		french: "Analyste des programmes"
	},
	{
		english: "Program Management Officer",
		french: "Agent ou agente de gestion de programmes"
	},
	{
		english: "Program Officer",
		french: "Agent ou agente des programmes"
	},
	{
		english: "Program Manager",
		french: "Gestionnaire de programmes"
	},
	{
		english: "Public Affairs Officer",
		french: "Agent ou agente des affaires publiques"
	},
	{
		english: "Scholar in Residence",
		french: "Chercheur ou chercheure en résidence"
	},
	{
		english: "Senior Advisor",
		french: "Conseiller principal ou conseillère principale"
	},
	{
		english: "Senior Director",
		french: "Directeur principal ou Directrice principale"
	},
	{
		english: "Senior Manager",
		french: "Gestionnaire principal"
	},
	{
		english: "Senior Policy Advisor",
		french: "Conseiller principal ou conseillère principale des politiques"
	},
	{
		english: "Senior Policy Analyst",
		french: "Analyste principale des politiques"
	},
	{
		english: "Senior Program Analyst",
		french: "Analyste de programme principal"
	},
	{
		english: "Senior Program Associate",
		french: "Responsable principale des programmes"
	},
	{
		english: "Senior Program Officer",
		french: "Administrateur ou administratrice de programme principal"
	},
	{
		english: "Team Lead",
		french: "Chef d'équipe"
	},
	{
		english: "Technical Advisor",
		french: "Conseiller ou conseillère technique"
	},
	{
		english: "Writer",
		french: "Auteur ou auteure"
	},
	{
		english: "Knowledge Management Team Lead",
		french: "Knowledge Management Team Lead"
	},
	{
		english: "Global Lead",
		french: "Global Lead"
	},
	{
		english: "Program Teaching Staff",
		french: "Program Teaching Staff"
	},
	{
		english: "Chief Programs Officer",
		french: "Chief Programs Officer"
	}
]


# Function to only add unique values
titles_list.each do |s|
	Title.find_or_create_by(english: s[:english], french: s[:french] )
end
