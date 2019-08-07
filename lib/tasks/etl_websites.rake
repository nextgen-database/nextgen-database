# Extraction, Transformation and Loading
# Taking the data from the existing database and moving it into the new database
# https://stuff-things.net/2016/11/02/importing-legacy-data-into-your-rails-app/

# Require the CSV Gem
require 'csv'

namespace(:ng) do
	namespace(:import) do

		#
		# Testing the waters
		#
		desc "Migrate Profiles"
		task :websites => :environment do

		json_data = '
			[
				{
				  "first_name": "Monica",
				  "last_name": "Lent",
				  "website-2": "http://www.sites.stfx.ca/business/mdiochon"
				},
				{
				  "first_name": "Faris",
				  "last_name": "Ahmed",
				  "website-2": "http://www.usc-canada.org/about-us/our-people/our-staff"
				},
				{
				  "first_name": "Siobhan",
				  "last_name": "Airey",
				  "website-2": "https://cdp-hrc.uottawa.ca/en/people/airey-siobhan"
				},
				{
				  "first_name": "Marlene",
				  "last_name": "Asselin",
				  "website-2": "http://lled.educ.ubc.ca/profiles/marlene-asselin/"
				},
				{
				  "first_name": "Patrick",
				  "last_name": "Brennan",
				  "website-2": "http://www.mcgill.ca/isid/leadership/directors/executive"
				},
				{
				  "first_name": "Chris",
				  "last_name": "Brown",
				  "website-2": "https://carleton.ca/polisci/people/brown-chris/"
				},
				{
				  "first_name": "Doris",
				  "last_name": "Buss",
				  "website-2": "https://carleton.ca/law/people/buss-doris-e/"
				},
				{
				  "first_name": "John",
				  "last_name": "Cameron",
				  "website-2": "https://www.dal.ca/faculty/arts/ids/faculty-staff/our-faculty/john-cameron.html"
				},
				{
				  "first_name": "Eric",
				  "last_name": "Chaurette",
				  "website-2": "https://interpares.ca/"
				},
				{
				  "first_name": "Poorvi",
				  "last_name": "Chitalkar ",
				  "website-2": "http://www.pluralism.ca/en/"
				},
				{
				  "first_name": "Paul",
				  "last_name": "Cliché",
				  "website-2": "http://fep.umontreal.ca/formations/certificats/intervention/cooperation-internationale/equipe-du-certificat/"
				},
				{
				  "first_name": "Suzanne",
				  "last_name": "Dansereau",
				  "website-2": "http://smu.ca/research/profiles/faculty/Dansereau23.html"
				},
				{
				  "first_name": "Raymond",
				  "last_name": "Dart",
				  "website-2": "https://www.trentu.ca/business/faculty-research/faculty-listing/raymond-dart"
				},
				{
				  "first_name": "Julie",
				  "last_name": "Desalliers",
				  "website-2": "http://www.fondations.org/"
				},
				{
				  "first_name": "Lindsay",
				  "last_name": "DuBois",
				  "website-2": "https://www.dal.ca/faculty/arts/sociology-social-anthropology/faculty-staff/our-faculty/lindsay-dubois.html"
				},
				{
				  "first_name": "Marc",
				  "last_name": "Epprecht",
				  "website-2": "http://www.queensu.ca/devs/faculty-profiles/marc-epprecht"
				},
				{
				  "first_name": "Bruce",
				  "last_name": "Frayne",
				  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/bruce-frayne"
				},
				{
				  "first_name": "Linda",
				  "last_name": "Freeman",
				  "website-2": "https://carleton.ca/polisci/people/freeman-linda/"
				},
				{
				  "first_name": "Allison",
				  "last_name": "Goebel",
				  "website-2": "http://www.queensu.ca/ensc/facultyresearch/allison-goebel"
				},
				{
				  "first_name": "Peter",
				  "last_name": "Gose",
				  "website-2": "https://carleton.ca/socanth/people/gose-peter/"
				},
				{
				  "first_name": "Simon",
				  "last_name": "Granovsky-Larsen",
				  "website-2": "https://www.uregina.ca/arts/politics-international-studies/faculty-staff/faculty/06-simon-granovsky-larsen.html"
				},
				{
				  "first_name": "Paul",
				  "last_name": "Hagerman",
				  "website-2": "http://foodgrainsbank.ca/"
				},
				{
				  "first_name": "Spencer",
				  "last_name": "Henson",
				  "website-2": "https://www.uoguelph.ca/fare/users/shenson"
				},
				{
				  "first_name": "Tina",
				  "last_name": "Hilgers",
				  "website-2": "https://www.concordia.ca/artsci/polisci/faculty.html?fpid=tina-hilgers"
				},
				{
				  "first_name": "Craig",
				  "last_name": "Johnson",
				  "website-2": "http://www.uoguelph.ca/csahs/web/research/faculty-profiles/craig-johnson-full-professor"
				},
				{
				  "first_name": "Laila",
				  "last_name": "Kasuri",
				  "website-2": "http://coady.stfx.ca"
				},
				{
				  "first_name": "John",
				  "last_name": "Kirk",
				  "website-2": "https://www.dal.ca/faculty/arts/spanish/faculty---staff/our-faculty/john-kirk.html"
				},
				{
				  "first_name": "Winnie",
				  "last_name": "Lem",
				  "website-2": "http://www.trentu.ca/ids/staff_lem.php"
				},
				{
				  "first_name": "John",
				  "last_name": "Marsh",
				  "website-2": "http://www.trentu.ca/academic/trailstudies/"
				},
				{
				  "first_name": "Ian",
				  "last_name": "McAllister",
				  "website-2": "https://www.dal.ca/faculty/science/economics/faculty-staff/our-faculty/honorary-adjunct-professors/ian-mcallister.html"
				},
				{
				  "first_name": "Pablo",
				  "last_name": "Mendez",
				  "website-2": "https://carleton.ca/geography/people/pablo-mendez/"
				},
				{
				  "first_name": "Pascasie",
				  "last_name": "Minani",
				  "website-2": "http://civmin.utoronto.ca/home/about-us/directory/professors/david-taylor/"
				},
				{
				  "first_name": "Tanjina",
				  "last_name": "Mirza",
				  "website-2": "http://plancanada.ca/executives"
				},
				{
				  "first_name": "Lauchlan",
				  "last_name": "Munro",
				  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/918"
				},
				{
				  "first_name": "Colleen",
				  "last_name": "O\'Manique",
				  "website-2": "https://www.trentu.ca/genderwomensstudies/faculty-research/colleen-omanique"
				},
				{
				  "first_name": "Jeremy",
				  "last_name": "Paltiel",
				  "website-2": "https://carleton.ca/polisci/people/paltiel-jeremy/"
				},
				{
				  "first_name": "Ajay",
				  "last_name": "Parasram",
				  "website-2": "https://www.dal.ca/faculty/arts/ids/faculty-staff/our-faculty/ajay-parasram.html"
				},
				{
				  "first_name": "Jane",
				  "last_name": "Parpart",
				  "website-2": "https://uniweb.uottawa.ca/#!uottawa/members/1066"
				},
				{
				  "first_name": "Raul",
				  "last_name": "Ponce-Hernandez",
				  "website-2": "https://www.trentu.ca/academic/gis/GEORESLAR-raul.html"
				},
				{
				  "first_name": "Fahim",
				  "last_name": "Quadir",
				  "website-2": "http://www.yorku.ca/fquadir/"
				},
				{
				  "first_name": "Daniel",
				  "last_name": "Rosenblatt",
				  "website-2": "https://carleton.ca/socanth/people/rosenblatt-daniel/"
				},
				{
				  "first_name": "Blair",
				  "last_name": "Rutherford",
				  "website-2": "https://carleton.ca/socanth/people/rutherford-blair/"
				},
				{
				  "first_name": "Cheyanne",
				  "last_name": "Scharbatke-Church",
				  "website-2": "https://www.linkedin.com/company/besa-catalyzing-strategic-change"
				},
				{
				  "first_name": "Paul",
				  "last_name": "Shaffer",
				  "website-2": "https://www.trentu.ca/ids/faculty-research/dr-paul-shaffer"
				},
				{
				  "first_name": "Meenal",
				  "last_name": "Shrivastava",
				  "website-2": "http://poec.athabascau.ca/faculty/mshrivastava/"
				},
				{
				  "first_name": "Deborah",
				  "last_name": "Simpson",
				  "website-2": "https://www.uregina.ca/arts/politics-international-studies/faculty-staff/faculty/16-simpson-deborah.html"
				},
				{
				  "first_name": "Derek",
				  "last_name": "Smith",
				  "website-2": "https://carleton.ca/geography/people/smith-derek-a/"
				},
				{
				  "first_name": "Adam",
				  "last_name": "Sneyd",
				  "website-2": "http://www.uoguelph.ca/csahs/web/research/faculty-profiles/adam-sneyd-associate-professor"
				},
				{
				  "first_name": "Gopika",
				  "last_name": "Solanki",
				  "website-2": "https://carleton.ca/polisci/people/solanki-gopika/"
				},
				{
				  "first_name": "Susan",
				  "last_name": "Spronk",
				  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/757"
				},
				{
				  "first_name": "Jean",
				  "last_name": "Symes",
				  "website-2": "https://interpares.ca/people/jean-symes-program-analyst"
				},
				{
				  "first_name": "Lynn",
				  "last_name": "Thornton",
				  "website-2": "http://videa.ca/about-videa/staff/"
				},
				{
				  "first_name": "Elly",
				  "last_name": "Vandenberg",
				  "website-2": "http://munkschool.utoronto.ca/profile/vandenberg-elly/"
				},
				{
				  "first_name": "Nevena",
				  "last_name": "Vucetic",
				  "website-2": "https://emergencymed.queensu.ca/faculty-staff/susan-bartels"
				},
				{
				  "first_name": "Christopher",
				  "last_name": "Worswick",
				  "website-2": "https://carleton.ca/economics/people/worswick-christopher/"
				},

	{
	  "first_name": "John",
	  "last_name": "Abraham",
	  "website-2": "https://www.wlu.ca/academics/faculties/faculty-of-arts/faculty-profiles/john-abraham/index.html"
	},
	{
	  "first_name": "Rita",
	  "last_name": "Abrahamsen",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/996"
	},
	{
	  "first_name": "Nadia",
	  "last_name": "Abu-Zahra",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/961"
	},
	{
	  "first_name": "Tikaram",
	  "last_name": "Adhikari",
	  "website-2": "http://www.uwinnipeg.ca/mdp/community/tikaram-adhikari.html"
	},
	{
	  "first_name": "Francesco",
	  "last_name": "Amodio",
	  "website-2": "https://sites.google.com/site/fscoamodio/"
	},
	{
	  "first_name": "Rowland (Caesar)",
	  "last_name": "Apentiik",
	  "website-2": "http://contacts.ucalgary.ca/info/antharky/profiles/115-45056"
	},
	{
	  "first_name": "Jobb",
	  "last_name": "Arnold",
	  "website-2": "http://www.mscollege.ca/about.php?s=faculty&id=531"
	},
	{
	  "first_name": "Peter",
	  "last_name": "Arthur",
	  "website-2": "https://www.dal.ca/faculty/arts/politicalscience/faculty-staff/our-faculty/arthur-peter.html"
	},
	{
	  "first_name": "Nasser",
	  "last_name": "Ary Tanimoune",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/786"
	},
	{
	  "first_name": "May",
	  "last_name": "Aung",
	  "website-2": "https://www.uoguelph.ca/business/people/may-aung"
	},
	{
	  "first_name": "Rahim",
	  "last_name": "Baba",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/1196"
	},
	{
	  "first_name": "Feyzi",
	  "last_name": "Baban",
	  "website-2": "http://www.trentu.ca/ids/staff_baban.php"
	},
	{
	  "first_name": "Roksana",
	  "last_name": "Bahramitash",
	  "website-2": "http://www.mcgill.ca/isid/bahramitash"
	},
	{
	  "first_name": "Manuel",
	  "last_name": "Balan",
	  "website-2": "https://manuelbalan.com/"
	},
	{
	  "first_name": "Pierre",
	  "last_name": "Beaudet",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/974"
	},
	{
	  "first_name": "Joanne",
	  "last_name": "Benham-Rennick",
	  "website-2": "https://www.wlu.ca/academics/faculties/faculty-of-arts/faculty-profiles/joanne-benham-rennick/index.html"
	},
	{
	  "first_name": "Katherine",
	  "last_name": "Bersch",
	  "website-2": "http://www.berschkatherine.com/"
	},
	{
	  "first_name": "Gordon",
	  "last_name": "Betcherman",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/875"
	},
	{
	  "first_name": "Christiaan",
	  "last_name": "Beyers",
	  "website-2": "http://www.trentu.ca/ids/staff_beyers.php"
	},
	{
	  "first_name": "Rahul",
	  "last_name": "Bhanwath",
	  "website-2": "http://www.unbc.ca/international-studies/faculty"
	},
	{
	  "first_name": "James P.",
	  "last_name": "Bickerton",
	  "website-2": "http://people.stfx.ca/jbickert/Bickerton/Welcome-JB.htm"
	},
	{
	  "first_name": "Anne-Emanuelle",
	  "last_name": "Birn",
	  "website-2": "http://www.utsc.utoronto.ca/ccds/anne-emanuelle-birn"
	},
	{
	  "first_name": "Aimé-Jules",
	  "last_name": "Bizimana",
	  "website-2": "http://apps.uqo.ca/DosEtuCorpsProf/PageProfesseur.aspx?id=aime-jules.bizimana@uqo.ca"
	},
	{
	  "first_name": "David",
	  "last_name": "Black",
	  "website-2": "https://www.dal.ca/faculty/arts/politicalscience/faculty-staff/our-faculty/david-black.html"
	},
	{
	  "first_name": "Alain",
	  "last_name": "Boutet",
	  "website-2": "https://www.dal.ca/faculty/arts/ids/faculty-staff/our-faculty/alain-boutet.html"
	},
	{
	  "first_name": "John",
	  "last_name": "Boye Ejobowah",
	  "website-2": "https://www.wlu.ca/academics/faculties/faculty-of-arts/faculty-profiles/john-boye-ejobowah/index.html"
	},
	{
	  "first_name": "Sarah",
	  "last_name": "Brauner- Otto",
	  "website-2": "http://www.mcgill.ca/sociology/faculty/sarah-brauner-otto"
	},
	{
	  "first_name": "Michael",
	  "last_name": "Brecher",
	  "website-2": "http://www.mcgill.ca/politicalscience/faculty/brecher/"
	},
	{
	  "first_name": "Louise",
	  "last_name": "Briand",
	  "website-2": "http://apps.uqo.ca/DosEtuCorpsProf/PageProfesseur.aspx?id=louise.briand@uqo.ca"
	},
	{
	  "first_name": "Rachel",
	  "last_name": "Brickner",
	  "website-2": "http://polisci.acadiau.ca/rachel-brickner.html"
	},
	{
	  "first_name": "Rex",
	  "last_name": "Brynen",
	  "website-2": "http://www.mcgill.ca/politicalscience/faculty/brynen"
	},
	{
	  "first_name": "Raphaël",
	  "last_name": "Canet",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/998"
	},
	{
	  "first_name": "Dominique",
	  "last_name": "Caouette",
	  "website-2": "http://pol.umontreal.ca/repertoire-departement/vue/caouette-dominique/"
	},
	{
	  "first_name": "Caroline",
	  "last_name": "Caron",
	  "website-2": "http://apps.uqo.ca/DosEtuCorpsProf/PageProfesseur.aspx?id=caroline.caron@uqo.ca"
	},
	{
	  "first_name": "Youngwon",
	  "last_name": "Cho",
	  "website-2": "http://people.stfx.ca/ycho/"
	},
	{
	  "first_name": "Saud",
	  "last_name": "Choudry",
	  "website-2": "https://www.trentu.ca/economics/staff_choudhry.php"
	},
	{
	  "first_name": "Jaime",
	  "last_name": "Cidro",
	  "website-2": "http://uwinnipeg.ca/anthropology/faculty/jaime-cidro.html"
	},
	{
	  "first_name": "Charles Joseph",
	  "last_name": "Clark",
	  "website-2": "http://www.mcgill.ca/isid/leadership/professors-practice#http://www.bac-lac.gc.ca/eng/discover/politics-government/prime-ministers/pmportrait/Pages/item.aspx?PersonId=16"
	},
	{
	  "first_name": "Shelley Dawn",
	  "last_name": "Clark",
	  "website-2": "http://www.mcgill.ca/sociology/faculty/clark/"
	},
	{
	  "first_name": "Janine",
	  "last_name": "Clark",
	  "website-2": "http://www.uoguelph.ca/csahs/web/research/faculty-profiles/janine-clark-associate-professor"
	},
	{
	  "first_name": "David",
	  "last_name": "Connell",
	  "website-2": "http://www.unbc.ca/international-studies-graduate-program/dr-david-j-connell"
	},
	{
	  "first_name": "Neil",
	  "last_name": "Craik",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/neil-craik"
	},
	{
	  "first_name": "Ruby",
	  "last_name": "Dagher",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/1120"
	},
	{
	  "first_name": "Robert",
	  "last_name": "David",
	  "website-2": "http://web5.uottawa.ca/www2/mcs-smc/media/experts-details-iframe-998106.html"
	},
	{
	  "first_name": "Martial",
	  "last_name": "Dembélé",
	  "website-2": "http://fse.umontreal.ca/a-propos-de-la-faculte/corps-professoral/details/utilisateur/martial-dembele-18/?no_cache=1&tx_lbocours_pluginusagerlist%5Baction%5D=view&tx_lbocours_pluginusagerlist%5Bcontroller%5D=Usager&cHash=99d31716a07e9c07824f1bdd5c7f5d2b"
	},
	{
	  "first_name": "Linda",
	  "last_name": "DeRiviere",
	  "website-2": "http://www.uwinnipeg.ca/political-science/faculty-bios/deriviere.html"
	},
	{
	  "first_name": "Marie-Eve",
	  "last_name": "Desrosiers",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/929"
	},
	{
	  "first_name": "Monique",
	  "last_name": "Deveaux",
	  "website-2": "https://www.uoguelph.ca/arts/philosophy/people/monique-deveaux"
	},
	{
	  "first_name": "John",
	  "last_name": "Devlin",
	  "website-2": "https://www.uoguelph.ca/sedrd/users/john-devlin"
	},
	{
	  "first_name": "Goretty",
	  "last_name": "Dias",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/goretty-dias"
	},
	{
	  "first_name": "Jordi",
	  "last_name": "Díez",
	  "website-2": "http://www.uoguelph.ca/csahs/web/research/faculty-profiles/jordi-d%C3%ADez-associate-professor"
	},
	{
	  "first_name": "Timothy",
	  "last_name": "Donais",
	  "website-2": "https://www.wlu.ca/academics/faculties/faculty-of-arts/faculty-profiles/timothy-donais/index.html"
	},
	{
	  "first_name": "Karen",
	  "last_name": "Dubinsky",
	  "website-2": "http://www.queensu.ca/devs/faculty-profiles/karen-dubinsky"
	},
	{
	  "first_name": "Jodi",
	  "last_name": "Dueck-Read",
	  "website-2": "http://www.mscollege.ca/about.php?s=faculty&id=532"
	},
	{
	  "first_name": "Julian",
	  "last_name": "Durazo Herrmann",
	  "website-2": "https://politique.uqam.ca/corps-professoral/professeurs/163-durazo-herrmann-julian.html"
	},
	{
	  "first_name": "Charis",
	  "last_name": "Enns",
	  "website-2": "https://www.balsillieschool.ca/people/charis-enns/"
	},
	{
	  "first_name": "Philippe",
	  "last_name": "Faucher",
	  "website-2": "http://pol.umontreal.ca/repertoire-departement/vue/faucher-philippe/"
	},
	{
	  "first_name": "Patricia",
	  "last_name": "Fitzpatrick",
	  "website-2": "http://geography.uwinnipeg.ca/faculty-fitzpatrick.htm"
	},
	{
	  "first_name": "John",
	  "last_name": "Fitzsimons",
	  "website-2": "https://www.uoguelph.ca/sedrd/users/john-fitzsimons"
	},
	{
	  "first_name": "Alberto",
	  "last_name": "Florez-Malagon",
	  "website-2": "http://arts.uottawa.ca/history/people/florez-malagon-alberto-g"
	},
	{
	  "first_name": "Jon",
	  "last_name": "Franklin",
	  "website-2": "http://uwwebpro.uwinnipeg.ca/academic/as/sociology/FacultyPages/Jonathan%20Franklin.htm"
	},
	{
	  "first_name": "Evan",
	  "last_name": "Fraser",
	  "website-2": "http://www.uoguelph.ca/geography/faculty/fraser-evan"
	},
	{
	  "first_name": "Neil",
	  "last_name": "Funk-Unrau",
	  "website-2": "http://www.mscollege.ca/about.php?s=faculty&id=496"
	},
	{
	  "first_name": "David J.",
	  "last_name": "Garbary",
	  "website-2": "http://publicationslist.org/dgarbary"
	},
	{
	  "first_name": "Robert",
	  "last_name": "Geneau",
	  "website-2": "https://socialsciences.uottawa.ca/international-development-global-studies/people/geneau-robert"
	},
	{
	  "first_name": "Sean",
	  "last_name": "Geobey",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/sean-geobey"
	},
	{
	  "first_name": "Sheri Lynn",
	  "last_name": "Gibbings",
	  "website-2": "https://www.wlu.ca/academics/faculties/faculty-of-arts/faculty-profiles/sheri-lynn-gibbings/index.html"
	},
	{
	  "first_name": "Deborah",
	  "last_name": "Glaser",
	  "website-2": "http://bccic.ca/members/deborah-glaser/"
	},
	{
	  "first_name": "Rosario",
	  "last_name": "Gomez",
	  "website-2": "https://www.uoguelph.ca/arts/solal/people/rosario-gomez"
	},
	{
	  "first_name": "Miguel",
	  "last_name": "Gonzalez",
	  "website-2": "http://people.laps.yorku.ca/people.nsf/researcherprofile?readform&shortname=migon"
	},
	{
	  "first_name": "Hugh",
	  "last_name": "Grant",
	  "website-2": "http://www.uwinnipeg.ca/economics/faculty-pages/grant.html"
	},
	{
	  "first_name": "Noella",
	  "last_name": "Gray",
	  "website-2": "http://www.uoguelph.ca/geography/faculty/gray-noella"
	},
	{
	  "first_name": "Franque",
	  "last_name": "Grimard",
	  "website-2": "https://mcgill.ca/Economics/franque-grimard"
	},
	{
	  "first_name": "Ricardo",
	  "last_name": "Grinspun",
	  "website-2": "http://people.laps.yorku.ca/people.nsf/researcherprofile?readform&shortname=ricardo"
	},
	{
	  "first_name": "Komal",
	  "last_name": "Habib",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/komal-habib"
	},
	{
	  "first_name": "Etienne",
	  "last_name": "Hainzelin",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/863"
	},
	{
	  "first_name": "Heather",
	  "last_name": "Hall",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/heather-m-hall"
	},
	{
	  "first_name": "S.P.",
	  "last_name": "Harish",
	  "website-2": "https://sites.google.com/site/harishsp/home"
	},
	{
	  "first_name": "Paul Alexander",
	  "last_name": "Haslam",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/983"
	},
	{
	  "first_name": "Roberta",
	  "last_name": "Hawkins",
	  "website-2": "http://www.uoguelph.ca/geography/faculty/hawkins-roberta"
	},
	{
	  "first_name": "Eric",
	  "last_name": "Hirsch",
	  "website-2": "http://www.ericmichaelhirsch.com/"
	},
	{
	  "first_name": "Jacqueline",
	  "last_name": "Holler",
	  "website-2": "http://www.unbc.ca/international-studies-graduate-program/dr-jacqueline-holler"
	},
	{
	  "first_name": "Mark",
	  "last_name": "Hostetler",
	  "website-2": "http://www.queensu.ca/devs/faculty-profiles/mark-hostetler"
	},
	{
	  "first_name": "Robert",
	  "last_name": "Huish",
	  "website-2": "https://www.dal.ca/faculty/arts/ids/faculty-staff/our-faculty/bob-huish.html"
	},
	{
	  "first_name": "Sally",
	  "last_name": "Humphries",
	  "website-2": "http://www.uoguelph.ca/csahs/web/research/faculty-profiles/sally-humphries-associate-professor"
	},
	{
	  "first_name": "Sandra",
	  "last_name": "Hyde",
	  "website-2": "http://www.mcgill.ca/anthropology/people/fulltime/sandrahyde/"
	},
	{
	  "first_name": "Pablo",
	  "last_name": "Idahosa",
	  "website-2": "http://people.laps.yorku.ca/people.nsf/researcherprofile?readform&shortname=pidahosa"
	},
	{
	  "first_name": "Uwafiokun",
	  "last_name": "Idemudia",
	  "website-2": "http://people.laps.yorku.ca/people.nsf/researcherprofile?readform&shortname=idemudia"
	},
	{
	  "first_name": "Lavagnon",
	  "last_name": "Ika",
	  "website-2": "http://www.telfer.uottawa.ca/en/directory/professors/ika-lavagnon"
	},
	{
	  "first_name": "Ryan",
	  "last_name": "Isakson",
	  "website-2": "http://www.utsc.utoronto.ca/ccds/ryan-isakson"
	},
	{
	  "first_name": "Villia",
	  "last_name": "Jefremovas",
	  "website-2": "http://www.queensu.ca/devs/faculty-profiles/villia-jefremovas"
	},
	{
	  "first_name": "Candace",
	  "last_name": "Johnson",
	  "website-2": "http://www.uoguelph.ca/csahs/web/research/faculty-profiles/candace-johnson-associate-professor"
	},
	{
	  "first_name": "Phillip",
	  "last_name": "Kelly",
	  "website-2": "http://people.laps.yorku.ca/people.nsf/researcherprofile?readform&shortname=pfkelly"
	},
	{
	  "first_name": "Sarah",
	  "last_name": "Kennell",
	  "website-2": "http://www.sexualhealthandrights.ca/about-us/#our_staff"
	},
	{
	  "first_name": "Thembela",
	  "last_name": "Kepe",
	  "website-2": "http://www.utsc.utoronto.ca/ccds/thembela-kepe"
	},
	{
	  "first_name": "Shahnaz",
	  "last_name": "Khan",
	  "website-2": "https://www.wlu.ca/academics/faculties/faculty-of-arts/faculty-profiles/shahnaz-khan/index.html"
	},
	{
	  "first_name": "Navjote",
	  "last_name": "Khara",
	  "website-2": "http://www.niagaracollege.ca/business-management-studies/faculty-profiles/ba-international-commerce-and-global-development/"
	},
	{
	  "first_name": "Paul",
	  "last_name": "Kingston",
	  "website-2": "http://www.utsc.utoronto.ca/ccds/paul-kingston"
	},
	{
	  "first_name": "Femi",
	  "last_name": "Kolapo",
	  "website-2": "https://www.uoguelph.ca/arts/history/people/femi-j-kolapo"
	},
	{
	  "first_name": "Paritosh",
	  "last_name": "Kumar",
	  "website-2": "http://www.queensu.ca/devs/faculty-profiles/paritosh-kumar"
	},
	{
	  "first_name": "Marina",
	  "last_name": "La Salle",
	  "website-2": "https://socialsciences.viu.ca/anthropology/marina-la-salle"
	},
	{
	  "first_name": "Jason",
	  "last_name": "Lacharite",
	  "website-2": "http://history.athabascau.ca/faculty/jlacharite/"
	},
	{
	  "first_name": "Jonathan",
	  "last_name": "Langdon",
	  "website-2": "http://stfx.academia.edu/JonathanLangdon"
	},
	{
	  "first_name": "Matthew",
	  "last_name": "Lange",
	  "website-2": "http://www.mcgill.ca/sociology/faculty/lange"
	},
	{
	  "first_name": "Alex",
	  "last_name": "Latta",
	  "website-2": "https://www.wlu.ca/academics/faculties/faculty-of-arts/faculty-profiles/alex-latta/index.html"
	},
	{
	  "first_name": "Jean-Philippe",
	  "last_name": "Leblond",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/802"
	},
	{
	  "first_name": "Imogene",
	  "last_name": "Lim",
	  "website-2": "http://wordpress.viu.ca/limi/"
	},
	{
	  "first_name": "Haiying",
	  "last_name": "Lin",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/haiying-lin"
	},
	{
	  "first_name": "Uli",
	  "last_name": "Locher",
	  "website-2": "http://www.mcgill.ca/isid/leadership/affiliate-members"
	},
	{
	  "first_name": "Robert",
	  "last_name": "Lovelace",
	  "website-2": "http://www.queensu.ca/devs/faculty-profiles/robert-lovelace"
	},
	{
	  "first_name": "Catherine",
	  "last_name": "Lu",
	  "website-2": "https://scholar.google.com/citations?user=G-J7QWoAAAAJ&hl=en"
	},
	{
	  "first_name": "Pascal",
	  "last_name": "Lupien",
	  "website-2": "http://www.ids.uoguelph.ca/?q=ids-affiliated-faculty/pascal-lupien"
	},
	{
	  "first_name": "Jennifer",
	  "last_name": "Lynes-Murray",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/jennifer-lynes"
	},
	{
	  "first_name": "Ken",
	  "last_name": "MacDonald",
	  "website-2": "http://www.utsc.utoronto.ca/ccds/ken-macdonald"
	},
	{
	  "first_name": "Richard",
	  "last_name": "Maclure",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/646"
	},
	{
	  "first_name": "Fiona",
	  "last_name": "Macphail",
	  "website-2": "http://www.unbc.ca/international-studies-graduate-program/dr-fiona-macphail"
	},
	{
	  "first_name": "Nissim",
	  "last_name": "Mannathukkaren",
	  "website-2": "https://www.dal.ca/faculty/arts/ids/faculty-staff/our-faculty/nissim-mannathukkaren.html"
	},
	{
	  "first_name": "Adam",
	  "last_name": "Martin",
	  "website-2": "http://www.utsc.utoronto.ca/ccds/adam-martin"
	},
	{
	  "first_name": "Andrea",
	  "last_name": "Martinez",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/925"
	},
	{
	  "first_name": "Nuah Makungu",
	  "last_name": "Masudi",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/1196"
	},
	{
	  "first_name": "Charles",
	  "last_name": "Mather",
	  "website-2": "http://contacts.ucalgary.ca/info/antharky/profiles/115-30884"
	},
	{
	  "first_name": "Alison",
	  "last_name": "Mathie",
	  "website-2": "http://coady.stfx.ca/coady/staff/alison/"
	},
	{
	  "first_name": "Jean François",
	  "last_name": "Mayer",
	  "website-2": "http://www.concordia.ca/artsci/polisci/faculty.html?fpid=jean-francois-mayer"
	},
	{
	  "first_name": "Edward",
	  "last_name": "McBean",
	  "website-2": "http://www.uoguelph.ca/~emcbean/"
	},
	{
	  "first_name": "Geoff",
	  "last_name": "McCarney",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/2235"
	},
	{
	  "first_name": "David",
	  "last_name": "McDonald",
	  "website-2": "http://www.queensu.ca/devs/david-mcdonald"
	},
	{
	  "first_name": "Marilou",
	  "last_name": "McPhedran",
	  "website-2": "http://www.uwinnipeg.ca/global-college/who-we-are/marilou-mcphedran.html"
	},
	{
	  "first_name": "Khaled Mustafa",
	  "last_name": "Medani",
	  "website-2": "http://www.mcgill.ca/politicalscience/faculty/medani"
	},
	{
	  "first_name": "Merouan",
	  "last_name": "Mekouar",
	  "website-2": "http://people.laps.yorku.ca/people.nsf/researcherprofile?readform&shortname=mmekouar"
	},
	{
	  "first_name": "Anne",
	  "last_name": "Meneley",
	  "website-2": "https://www.trentu.ca/anthropology/meneley.php"
	},
	{
	  "first_name": "Getrude",
	  "last_name": "Mianda",
	  "website-2": "http://people.laps.yorku.ca/people.nsf/researcherprofile?readform&shortname=mianda"
	},
	{
	  "first_name": "Claudia",
	  "last_name": "Mitchell",
	  "website-2": "http://www.mcgill.ca/dise/about/academicstaff/mitchell"
	},
	{
	  "first_name": "Sharlene",
	  "last_name": "Mollett",
	  "website-2": "http://www.utsc.utoronto.ca/ccds/sharlene-mollett"
	},
	{
	  "first_name": "Ananya",
	  "last_name": "Mukherjee",
	  "website-2": "http://laps.yorku.ca/about/dean-mukherjee-reed-bio/"
	},
	{
	  "first_name": "Delphone",
	  "last_name": "Nakache",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/853"
	},
	{
	  "first_name": "Prateep",
	  "last_name": "Nayak",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/prateep-nayak"
	},
	{
	  "first_name": "Erin",
	  "last_name": "Nelson",
	  "website-2": "http://www.ids.uoguelph.ca/?q=ids-affiliated-faculty/erin-nelson"
	},
	{
	  "first_name": "Gabriel",
	  "last_name": "Nemogá",
	  "website-2": "http://www.uwinnipeg.ca/maig/faculty-bios/bio-soto.html"
	},
	{
	  "first_name": "Robert",
	  "last_name": "Niezen",
	  "website-2": "http://www.mcgill.ca/anthropology/people/fulltime/ronaldniezen/"
	},
	{
	  "first_name": "Catherine",
	  "last_name": "Nolin",
	  "website-2": "http://www.unbc.ca/catherine-nolin"
	},
	{
	  "first_name": "Kristin",
	  "last_name": "Norget",
	  "website-2": "https://www.mcgill.ca/anthropology/people/fulltime/kristinnorget"
	},
	{
	  "first_name": "Melanie",
	  "last_name": "O\'Gorman",
	  "website-2": "http://ion.uwinnipeg.ca/~mogorman/"
	},
	{
	  "first_name": "James",
	  "last_name": "Orbinski",
	  "website-2": "https://www.balsillieschool.ca/people/james-orbinski/"
	},
	{
	  "first_name": "Philip",
	  "last_name": "Oxhorn",
	  "website-2": "https://www.mcgill.ca/politicalscience/faculty/oxhorn"
	},
	{
	  "first_name": "Jesse",
	  "last_name": "Palsetia",
	  "website-2": "https://www.uoguelph.ca/arts/history/people/jesse-palsetia"
	},
	{
	  "first_name": "Kate",
	  "last_name": "Parizeau",
	  "website-2": "http://www.ids.uoguelph.ca/?q=ids-faculty/kate-parizeau"
	},
	{
	  "first_name": "Paul",
	  "last_name": "Parker",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/paul-parker"
	},
	{
	  "first_name": "Kirit",
	  "last_name": "Patel",
	  "website-2": "http://www.mscollege.ca/about.php?s=faculty&id=522"
	},
	{
	  "first_name": "Viviana",
	  "last_name": "Patroni",
	  "website-2": "http://people.laps.yorku.ca/people.nsf/researcherprofile?readform&shortname=vpatroni"
	},
	{
	  "first_name": "Peter",
	  "last_name": "Penz",
	  "website-2": "https://about.me/peterpenz"
	},
	{
	  "first_name": "Paola",
	  "last_name": "Perez-Aleman",
	  "website-2": "http://www.mcgill.ca/desautels/paola-perez-aleman"
	},
	{
	  "first_name": "Maria",
	  "last_name": "Popova",
	  "website-2": "http://www.mcgill.ca/politicalscience/faculty/popova"
	},
	{
	  "first_name": "Amy",
	  "last_name": "Poteete",
	  "website-2": "http://www.concordia.ca/artsci/polisci/faculty.html?fpid=amy-poteete"
	},
	{
	  "first_name": "Jefferey",
	  "last_name": "Potkins",
	  "website-2": "http://govn.athabascau.ca/faculty/jpotkins/"
	},
	{
	  "first_name": "Edmund",
	  "last_name": "Pries",
	  "website-2": "https://www.wlu.ca/academics/faculties/faculty-of-arts/faculty-profiles/edmund-pries/index.html"
	},
	{
	  "first_name": "Karen",
	  "last_name": "Racine",
	  "website-2": "https://www.uoguelph.ca/arts/history/people/karen-racine"
	},
	{
	  "first_name": "Paul",
	  "last_name": "Redekop",
	  "website-2": "http://www.mscollege.ca/about.php?s=faculty&id=519"
	},
	{
	  "first_name": "Philippe",
	  "last_name": "Régnier",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/992"
	},
	{
	  "first_name": "Ruth",
	  "last_name": "Rempel",
	  "website-2": "http://www.mscollege.ca/about.php?s=faculty&id=516"
	},
	{
	  "first_name": "Tanya",
	  "last_name": "Richardson",
	  "website-2": "https://www.wlu.ca/academics/faculties/faculty-of-arts/faculty-profiles/tanya-richardson/index.html"
	},
	{
	  "first_name": "Karen",
	  "last_name": "Ridd",
	  "website-2": "http://www.mscollege.ca/about.php?s=faculty&id=503"
	},
	{
	  "first_name": "Liam",
	  "last_name": "Riley",
	  "website-2": "https://www.balsillieschool.ca/people/liam-riley"
	},
	{
	  "first_name": "Dylan",
	  "last_name": "Robinson",
	  "website-2": "http://www.queensu.ca/llcu/people/faculty/dylan-robinson"
	},
	{
	  "first_name": "Jacqueline",
	  "last_name": "Romanow",
	  "website-2": "http://www.uwinnipeg.ca/maig/faculty-bios/bio-romanow.html"
	},
	{
	  "first_name": "Stéphanie",
	  "last_name": "Rousseau",
	  "website-2": "http://www.soc.ulaval.ca/?pid=1169"
	},
	{
	  "first_name": "Jean-François",
	  "last_name": "Rousseau",
	  "website-2": "https://socialsciences.uottawa.ca/international-development-global-studies/people/rousseau-jean-francois"
	},
	{
	  "first_name": "Poulami",
	  "last_name": "Roychowdhury",
	  "website-2": "http://www.mcgill.ca/sociology/faculty/poulami-roychowdhury"
	},
	{
	  "first_name": "Mark",
	  "last_name": "Ruml",
	  "website-2": "https://uwinnipeg.ca/religion-and-culture/faculty/mark-ruml.html"
	},
	{
	  "first_name": "Scott",
	  "last_name": "Rutherford",
	  "website-2": "http://www.queensu.ca/devs/faculty-profiles/scott-rutherford"
	},
	{
	  "first_name": "Harry",
	  "last_name": "Sackey",
	  "website-2": "https://management.viu.ca/economics/harry-sackey"
	},
	{
	  "first_name": "Jalil",
	  "last_name": "Safaei",
	  "website-2": "http://www.unbc.ca/international-studies-graduate-program/dr-jalil-safaei"
	},
	{
	  "first_name": "Kim",
	  "last_name": "Samuel",
	  "website-2": "http://www.socialconnectedness.org/kim-samuel/"
	},
	{
	  "first_name": "Catherine",
	  "last_name": "Schittecatte",
	  "website-2": "https://www2.viu.ca/directory/employeeDetail.aspx?emp=F4777DBE7B6FAE29"
	},
	{
	  "first_name": "Albert",
	  "last_name": "Schrauwers",
	  "website-2": "http://people.laps.yorku.ca/people.nsf/researcherprofile?readform&shortname=schrauwe"
	},
	{
	  "first_name": "Marie-Claire",
	  "last_name": "Segger",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/marie-claire-cordonier-segger"
	},
	{
	  "first_name": "Julie",
	  "last_name": "Seirlis",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/julie-kate-seirlis"
	},
	{
	  "first_name": "Shailesh",
	  "last_name": "Shukla",
	  "website-2": "http://www.uwinnipeg.ca/maig/faculty-bios/bio-shukla.html"
	},
	{
	  "first_name": "Simron",
	  "last_name": "Singh",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/simron-singh"
	},
	{
	  "first_name": "Alicia",
	  "last_name": "Sliwinski",
	  "website-2": "https://www.wlu.ca/academics/faculties/faculty-of-arts/faculty-profiles/alicia-sliwinski/index.html"
	},
	{
	  "first_name": "Alan",
	  "last_name": "Smart",
	  "website-2": "https://antharky.ucalgary.ca/manageprofile/profiles/115-30889"
	},
	{
	  "first_name": "P.L. Josephine",
	  "last_name": "Smart",
	  "website-2": "https://antharky.ucalgary.ca/manageprofile/profiles/115-30888"
	},
	{
	  "first_name": "Norman",
	  "last_name": "Smith",
	  "website-2": "https://www.uoguelph.ca/arts/history/people/norman-smith"
	},
	{
	  "first_name": "Heather",
	  "last_name": "Smith",
	  "website-2": "http://www.unbc.ca/international-studies-graduate-program/dr-heather-smith"
	},
	{
	  "first_name": "Susanne",
	  "last_name": "Soederberg",
	  "website-2": "http://www.queensu.ca/devs/faculty-profiles/susanne-soederberg"
	},
	{
	  "first_name": "Ian",
	  "last_name": "Spears",
	  "website-2": "http://www.uoguelph.ca/csahs/web/research/faculty-profiles/ian-spears-associate-professor"
	},
	{
	  "first_name": "Stephanie",
	  "last_name": "Stobbe",
	  "website-2": "http://www.mscollege.ca/about.php?s=faculty&id=497"
	},
	{
	  "first_name": "Laura",
	  "last_name": "Suski",
	  "website-2": "https://www2.viu.ca/directory/employeeDetail.aspx?emp=3174E8B3465DECBF"
	},
	{
	  "first_name": "Larry",
	  "last_name": "Swatuk",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/larry-swatuk"
	},
	{
	  "first_name": "Anna",
	  "last_name": "Synder",
	  "website-2": "http://www.mscollege.ca/about.php?s=faculty&id=520"
	},
	{
	  "first_name": "Oliver",
	  "last_name": "T. Coomes",
	  "website-2": "http://www.geog.mcgill.ca/faculty/coomes/"
	},
	{
	  "first_name": "Chui-Ling",
	  "last_name": "Tam",
	  "website-2": "https://geog.ucalgary.ca/profiles/chui-ling-tam"
	},
	{
	  "first_name": "Patrick",
	  "last_name": "Taylor",
	  "website-2": "http://people.laps.yorku.ca/people.nsf/researcherprofile?readform&shortname=taylorp"
	},
	{
	  "first_name": "Marcus",
	  "last_name": "Taylor",
	  "website-2": "http://www.queensu.ca/devs/faculty-profiles/marcus-taylor"
	},
	{
	  "first_name": "Nancy",
	  "last_name": "Thede",
	  "website-2": "http://politique.uqam.ca/corps-professoral/professeurs/183-thede-nancy.html"
	},
	{
	  "first_name": "Jason",
	  "last_name": "Thistlethwaite",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/jason-thistlethwaite"
	},
	{
	  "first_name": "William",
	  "last_name": "Troost",
	  "website-2": "https://www2.viu.ca/directory/employeeDetail.aspx?emp=CEFEA9FB91AC7BA1"
	},
	{
	  "first_name": "Theresa",
	  "last_name": "Ulicki",
	  "website-2": "https://www.dal.ca/faculty/arts/ids/faculty-staff/our-faculty/thesesa-ulicki.html"
	},
	{
	  "first_name": "Peter",
	  "last_name": "Vandergeest",
	  "website-2": "http://people.laps.yorku.ca/people.nsf/researcherprofile?readform&shortname=pvander"
	},
	{
	  "first_name": "Tara",
	  "last_name": "Vinodrai",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/tara-vinodrai"
	},
	{
	  "first_name": "Bettina",
	  "last_name": "Von Lieres",
	  "website-2": "http://www.utsc.utoronto.ca/ccds/bettina-von-lieres"
	},
	{
	  "first_name": "Juan",
	  "last_name": "Wang",
	  "website-2": "http://www.mcgill.ca/politicalscience/faculty/wang"
	},
	{
	  "first_name": "Baotai",
	  "last_name": "Wang",
	  "website-2": "http://www.unbc.ca/international-studies-graduate-program/dr-baotai-wang"
	},
	{
	  "first_name": "Olaf",
	  "last_name": "Weber",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/olaf-weber"
	},
	{
	  "first_name": "Alfons",
	  "last_name": "Weersink",
	  "website-2": "https://www.uoguelph.ca/fare/bios/f_weersink.html"
	},
	{
	  "first_name": "Awet T.",
	  "last_name": "Weldemichael",
	  "website-2": "http://www.queensu.ca/history/people/facultyinstructors/weldemichael-awet"
	},
	{
	  "first_name": "Tom",
	  "last_name": "Whillans",
	  "website-2": "https://www.trentu.ca/environment/faculty-research/tom-whillans"
	},
	{
	  "first_name": "Mark",
	  "last_name": "Williams",
	  "website-2": "https://www2.viu.ca/directory/employeeDetail.aspx?emp=C61AF3E461CE1EE7"
	},
	{
	  "first_name": "Owen",
	  "last_name": "Willis",
	  "website-2": "https://www.dal.ca/faculty/arts/ids/faculty-staff/our-faculty/owen-willis.html"
	},
	{
	  "first_name": "Warren",
	  "last_name": "Wilson",
	  "website-2": "https://antharky.ucalgary.ca/manageprofile/profiles/115-30895"
	},
	{
	  "first_name": "Michael",
	  "last_name": "Wood",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/michael-wood"
	},
	{
	  "first_name": "Alfred",
	  "last_name": "Yaeger",
	  "website-2": "http://www.mcgill.ca/desautels/alfred-jaeger"
	},
	{
	  "first_name": "Nonita",
	  "last_name": "Yap",
	  "website-2": "https://www.uoguelph.ca/sedrd/users/nonita-yap"
	},
	{
	  "first_name": "Sanni",
	  "last_name": "Yaya",
	  "website-2": "https://uniweb.uottawa.ca/?lang=en#!/members/114"
	},
	{
	  "first_name": "Steven",
	  "last_name": "Young",
	  "website-2": "https://uwaterloo.ca/school-environment-enterprise-development/people-profiles/steven-b-young"
	},
	{
	  "first_name": "Gordana",
	  "last_name": "Yovanovich",
	  "website-2": "https://www.uoguelph.ca/arts/solal/people/gordana-yovanovich"
	},
	{
	  "first_name": "Marie-Joelle",
	  "last_name": "Zahar",
	  "website-2": "http://pol.umontreal.ca/repertoire-departement/vue/zahar-marie-joelle/"
	},
	{
	  "first_name": "Ali",
	  "last_name": "Zaidi",
	  "website-2": "https://www.wlu.ca/academics/faculties/faculty-of-arts/faculty-profiles/ali-hassan-zaidi/index.html"
	},
	{
	  "first_name": "Gordon",
	  "last_name": "Zebbe",
	  "website-2": "http://www.mscollege.ca/about.php?s=faculty&id=495"
	}
   ]'

   			profile_website_data = JSON.parse(json_data)

			found = 0
			does_not_have_website = 0
			has_website = 0

			profile_website_data.each_with_index do |row, index|

				if Profile.where(firstname: row['first_name'], lastname: row['last_name']).exists?
					found = found + 1

					# Add logic to add the website

					if Profile.find_by(firstname: row['first_name'], lastname: row['last_name']).website.blank?
						does_not_have_website = does_not_have_website + 1

						profile = Profile.find_by(firstname: row['first_name'], lastname: row['last_name'])

						profile.website = row['website-2']

						profile.save!

					else
						has_website = has_website + 1
					end

				else
					puts "ERROR: Cound not find: #{row['first_name']} #{row['last_name']}"
				end

				#puts "First Name: #{row['first_name']}"
				#puts "Last Name: #{row['last_name']}"
				#puts "Website: #{row['website-2']}"
				#puts ""

			end

			puts "We found #{found} entries in the db out of #{profile_website_data.count}"

			puts "Out of the entries that we found, #{has_website} entries already had a website and #{does_not_have_website} do not have a website set"

			puts "We have updated #{does_not_have_website} entries"

			# Display all of the person ids
			#width = profile_keys.flatten.max.to_s.size+2
				#=> 4
			#puts profile_keys.map { |a| a.map { |i| i.to_s.rjust(width) }.join }

			puts "END..."

		end
	end
end
