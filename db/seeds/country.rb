# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

countries_list = [
	{
		english: "Anguilla",
		french: "Anguilla"
	},
	{
		english: "Antigua and Barbuda",
		french: "Antigua-et-Barbuda"
	},
	{
		english: "Aruba",
		french: "Aruba"
	},
	{
		english: "Bahamas",
		french: "Bahamas"
	},
	{
		english: "Barbados",
		french: "Barbade"
	},
	{
		english: "Bermuda",
		french: "Bermudes"
	},
	{
		english: "Bonaire, Sint Eustatius and Saba",
		french: "Bonaire, Saint-Eustache et Saba"
	},
	{
		english: "British Virgin Islands",
		french: "Îles Vierges britanniques"
	},
	{
		english: "Cayman Islands",
		french: "Îles Caïmans"
	},
	{
		english: "Cuba",
		french: "Cuba"
	},
	{
		english: "Curaçao",
		french: "Curaçao"
	},
	{
		english: "Dominica",
		french: "Dominique"
	},
	{
		english: "Dominican Republic",
		french: "République dominicaine"
	},
	{
		english: "Grenada",
		french: "Grenade"
	},
	{
		english: "Guadeloupe",
		french: "Guadeloupe"
	},
	{
		english: "Haiti",
		french: "Haïti"
	},
	{
		english: "Jamaica",
		french: "Jamaïque"
	},
	{
		english: "Martinique",
		french: "Martinique"
	},
	{
		english: "Montserrat",
		french: "Montserrat"
	},
	{
		english: "Puerto Rico",
		french: "Porto Rico"
	},
	{
		english: "Saint Kitts and Nevis",
		french: "Saint-Barthélemy"
	},
	{
		english: "Saint Lucia",
		french: "Saint-Kitts-et-Nevis"
	},
	{
		english: "Saint Martin ",
		french: "Sainte-Lucie"
	},
	{
		english: "Saint Vincent and the Grenadines",
		french: "Île de Saint-Martin"
	},
	{
		english: "Saint-Barthélemy",
		french: "Saint-Vincent-et-les-Grenadines"
	},
	{
		english: "Sint Maarten",
		french: "Saint-Martin "
	},
	{
		english: "Trinidad and Tobago",
		french: "Trinité-et-Tobago"
	},
	{
		english: "Turks and Caicos Islands",
		french: "Îles Turks et Caicos"
	},
	{
		english: "United States Virgin Islands",
		french: "Îles Vierges américaines"
	},
	{
		english: "Belize",
		french: "Belize"
	},
	{
		english: "Cocos (Keeling) Island",
		french: "Îles Cocos (îles Keeling)"
	},
	{
		english: "Costa Rica",
		french: "Costa Rica"
	},
	{
		english: "El Salvador",
		french: "El Salvador"
	},
	{
		english: "Guatemala",
		french: "Guatemala"
	},
	{
		english: "Honduras",
		french: "Honduras"
	},
	{
		english: "Nicaragua",
		french: "Nicaragua"
	},
	{
		english: "Panama",
		french: "Panama"
	},
	{
		english: "Canada",
		french: "Canada"
	},
	{
		english: "Mexico",
		french: "Mexique"
	},
	{
		english: "Saint Pierre and Miquelon",
		french: "Saint-Pierre et Miquelon"
	},
	{
		english: "United States of America",
		french: "États-Unis d'Amérique"
	},
	{
		english: "Argentina",
		french: "Argentine"
	},
	{
		english: "Bolivia",
		french: "Bolivie"
	},
	{
		english: "Brazil",
		french: "Brésil"
	},
	{
		english: "Chile",
		french: "Chili"
	},
	{
		english: "Colombia",
		french: "Colombie"
	},
	{
		english: "Ecuador",
		french: "Équateur"
	},
	{
		english: "Falkland Islands (Malvinas)",
		french: "Îles Malouines (îles Falkland)"
	},
	{
		english: "French Guyana",
		french: "Guyane française"
	},
	{
		english: "Guyana",
		french: "Guyana"
	},
	{
		english: "Paraguay",
		french: "Paraguay"
	},
	{
		english: "Peru",
		french: "Pérou"
	},
	{
		english: "South Georgia and the South Sandwich Islands",
		french: "Géorgie du Sud et îles Sandwich-du-Sud"
	},
	{
		english: "Suriname",
		french: "Suriname"
	},
	{
		english: "Uruguay",
		french: "Uruguay"
	},
	{
		english: "Venezuela",
		french: "Venezuela"
	},
	{
		english: "Afghanistan",
		french: "Afghanistan"
	},
	{
		english: "Armenia",
		french: "Arménie"
	},
	{
		english: "Azerbaijan",
		french: "Azerbaïdjan"
	},
	{
		english: "Georgia",
		french: "Géorgie"
	},
	{
		english: "Kazakhstan",
		french: "Kazakhstan"
	},
	{
		english: "Kyrgyzstan",
		french: "Kirghizistan"
	},
	{
		english: "Tajikistan",
		french: "Tadjikistan"
	},
	{
		english: "Turkmenistan",
		french: "Turkménistan"
	},
	{
		english: "Uzbekistan",
		french: "Ouzbékistan"
	},
	{
		english: "China",
		french: "Chine"
	},
	{
		english: "Hong Kong (China)",
		french: "Hong Kong (Chine)"
	},
	{
		english: "Japan",
		french: "Japon"
	},
	{
		english: "Macao (China)",
		french: "Macao (Chine)"
	},
	{
		english: "Mongolia",
		french: "Mongolie"
	},
	{
		english: "North Korea",
		french: "Corée du Nord"
	},
	{
		english: "South Korea",
		french: "Corée du Sud"
	},
	{
		english: "Taiwan",
		french: "Taïwan"
	},
	{
		english: "Bangladesh",
		french: "Bangladesh"
	},
	{
		english: "Bhutan",
		french: "Bhoutan"
	},
	{
		english: "British Indian Ocean Territory",
		french: "Territoire britannique de l'océan Indien"
	},
	{
		english: "India",
		french: "Inde"
	},
	{
		english: "Maldives",
		french: "Maldives"
	},
	{
		english: "Nepal",
		french: "Népal"
	},
	{
		english: "Pakistan",
		french: "Pakistan"
	},
	{
		english: "Sri Lanka",
		french: "Sri Lanka"
	},
	{
		english: "Brunei Darussalam",
		french: "Brunéi Darussalam"
	},
	{
		english: "Cambodia",
		french: "Cambodge"
	},
	{
		english: "Indonesia",
		french: "Indonésie"
	},
	{
		english: "Laos",
		french: "Laos"
	},
	{
		english: "Malaysia",
		french: "Malaisie"
	},
	{
		english: "Myanmar (Burma)",
		french: "Myanmar (Burmanie)"
	},
	{
		english: "Philippines",
		french: "Philippines"
	},
	{
		english: "Singapore",
		french: "Singapour"
	},
	{
		english: "Thailand",
		french: "Thaïlande"
	},
	{
		english: "Timor-Leste",
		french: "Timor-Leste"
	},
	{
		english: "Vietnam",
		french: "Vietnam"
	},
	{
		english: "Belarus",
		french: "Bélarus"
	},
	{
		english: "Bulgaria",
		french: "Bulgarie"
	},
	{
		english: "Czech Republic",
		french: "République tchèque"
	},
	{
		english: "Hungary",
		french: "Hongrie"
	},
	{
		english: "Moldova",
		french: "Pologne"
	},
	{
		english: "Poland",
		french: "Moldova"
	},
	{
		english: "Romania",
		french: "Roumanie"
	},
	{
		english: "Russia",
		french: "Russie"
	},
	{
		english: "Slovakia",
		french: "Slovaquie"
	},
	{
		english: "Ukraine",
		french: "Ukraine"
	},
	{
		english: "Åland Islands",
		french: "Îles Åland "
	},
	{
		english: "Denmark",
		french: "Danemark"
	},
	{
		english: "Estonia",
		french: "Estonie"
	},
	{
		english: "Faroe Islands",
		french: "Îles Féroé"
	},
	{
		english: "Finland",
		french: "Finlande"
	},
	{
		english: "Greenland",
		french: "Groenland"
	},
	{
		english: "Iceland",
		french: "Islande"
	},
	{
		english: "Latvia",
		french: "Lettonie"
	},
	{
		english: "Lithuania",
		french: "Lituanie"
	},
	{
		english: "Norway",
		french: "Norvège"
	},
	{
		english: "Sark",
		french: "Sercq"
	},
	{
		english: "Svalbard and Jan Mayen Islands",
		french: "Svalbard et île de Jan Mayen"
	},
	{
		english: "Sweden",
		french: "Suède"
	},
	{
		english: "Albania",
		french: "Albanie"
	},
	{
		english: "Andorra",
		french: "Andorre"
	},
	{
		english: "Bosnia and Herzegovina",
		french: "Bosnie-Herzégovine"
	},
	{
		english: "Croatia",
		french: "Croatie"
	},
	{
		english: "Cyprus",
		french: "Chypre"
	},
	{
		english: "Gibraltar",
		french: "Gibraltar"
	},
	{
		english: "Greece",
		french: "Grèce"
	},
	{
		english: "Holy See (Vatican City)",
		french: "Saint-Siège (Cité du Vatican)"
	},
	{
		english: "Italy",
		french: "Italie"
	},
	{
		english: "Kosovo",
		french: "Kosovo"
	},
	{
		english: "Macedonia",
		french: "Macédoine"
	},
	{
		english: "Malta",
		french: "Malte"
	},
	{
		english: "Montenegro",
		french: "Monténégro"
	},
	{
		english: "Portugal",
		french: "Portugal"
	},
	{
		english: "San Marino",
		french: "Saint-Marin"
	},
	{
		english: "Serbia",
		french: "Serbie"
	},
	{
		english: "Slovenia",
		french: "Slovénie"
	},
	{
		english: "Spain",
		french: "Espagne"
	},
	{
		english: "Austria",
		french: "Autriche"
	},
	{
		english: "Belgium",
		french: "Belgique"
	},
	{
		english: "Channel Islands",
		french: "Îles de la Manche"
	},
	{
		english: "France",
		french: "France"
	},
	{
		english: "Germany",
		french: "Allemagne"
	},
	{
		english: "Guernsey",
		french: "Guernsey"
	},
	{
		english: "Ireland",
		french: "Irlande"
	},
	{
		english: "Isle of Man",
		french: "Île de Man"
	},
	{
		english: "Jersey",
		french: "Jersey"
	},
	{
		english: "Liechtenstein",
		french: "Liechtenstein"
	},
	{
		english: "Luxembourg",
		french: "Luxembourg"
	},
	{
		english: "Monaco",
		french: "Monaco"
	},
	{
		english: "Netherlands",
		french: "Pays-Bas"
	},
	{
		english: "Switzerland",
		french: "Suisse"
	},
	{
		english: "United Kingdom of Great Britain and Northern Ireland",
		french: "Royaume-Uni de Grande-Bretagne et d'Irlande du Nord"
	},
	{
		english: "Bahrain",
		french: "Bahreïn"
	},
	{
		english: "Iran",
		french: "Iran"
	},
	{
		english: "Iraq",
		french: "Iraq"
	},
	{
		english: "Israel",
		french: "Israël"
	},
	{
		english: "Jordan",
		french: "Jordanie"
	},
	{
		english: "Kuwait",
		french: "Koweït"
	},
	{
		english: "Lebanon",
		french: "Liban"
	},
	{
		english: "Oman",
		french: "Oman"
	},
	{
		english: "Qatar",
		french: "Qatar"
	},
	{
		english: "Saudi Arabia",
		french: "Arabie saoudite"
	},
	{
		english: "Syria",
		french: "Syrie"
	},
	{
		english: "Turkey",
		french: "Turquie"
	},
	{
		english: "United Arab Emirates",
		french: "Émirats arabes unis"
	},
	{
		english: "West Bank and Gaza",
		french: "Cisjordanie et bande de Gaza"
	},
	{
		english: "Yemen",
		french: "Yémen"
	},
	{
		english: "Algeria",
		french: "Algérie"
	},
	{
		english: "Egypt",
		french: "Égypte"
	},
	{
		english: "Libya",
		french: "Libye"
	},
	{
		english: "Morocco",
		french: "Maroc"
	},
	{
		english: "Sudan",
		french: "Soudan"
	},
	{
		english: "Tunisia",
		french: "Tunisie"
	},
	{
		english: "Western Sahara",
		french: "Sahara occidental"
	},
	{
		english: "Australia",
		french: "Australie"
	},
	{
		english: "Bouvet Island",
		french: "Île Bouvet"
	},
	{
		english: "Christmas Island",
		french: "Île Christmas"
	},
	{
		english: "Heard Island and Mcdonald Islands",
		french: "Îles Heard et McDonald"
	},
	{
		english: "New Zealand",
		french: "Nouvelle-Zélande"
	},
	{
		english: "Norfolk Island",
		french: "Île Norfolk"
	},
	{
		english: "Fiji",
		french: "Fidji"
	},
	{
		english: "New Caledonia",
		french: "Nouvelle-Calédonie"
	},
	{
		english: "Papua New Guinea",
		french: "Papouasie-Nouvelle-Guinée "
	},
	{
		english: "Solomon Islands",
		french: "Îles Salomon"
	},
	{
		english: "Vanuatu",
		french: "Vanuatu"
	},
	{
		english: "Guam",
		french: "Guam"
	},
	{
		english: "Kiribati",
		french: "Kiribati"
	},
	{
		english: "Marshall Islands",
		french: "Îles Marshall"
	},
	{
		english: "Micronesia",
		french: "Micronésie"
	},
	{
		english: "Nauru",
		french: "Nauru"
	},
	{
		english: "Northern Mariana Islands",
		french: "Îles Mariannes du Nord"
	},
	{
		english: "Palau",
		french: "Palaos"
	},
	{
		english: "United States Minor Outlying Islands",
		french: "Îles mineures éloignées des États-Unis "
	},
	{
		english: "American Samoa",
		french: "Samoa américaines"
	},
	{
		english: "Cook Islands",
		french: "Îles Cook"
	},
	{
		english: "French Polynesia",
		french: "Polynésie française"
	},
	{
		english: "Niue",
		french: "Nioué"
	},
	{
		english: "Pitcairn",
		french: "Pitcairn"
	},
	{
		english: "Samoa",
		french: "Samoa"
	},
	{
		english: "Tokelau",
		french: "Tokelau"
	},
	{
		english: "Tonga",
		french: "Tonga"
	},
	{
		english: "Tuvalu",
		french: "Tuvalu"
	},
	{
		english: "Wallis and Futuna Islands",
		french: "Îles Wallis-et-Futuna"
	},
	{
		english: "Angola",
		french: "Angola"
	},
	{
		english: "Cameroon",
		french: "Cameroun"
	},
	{
		english: "Central African Republic",
		french: "République centrafricaine"
	},
	{
		english: "Chad",
		french: "Tchad"
	},
	{
		english: "Democratic Republic of the Congo",
		french: "République démocratique du Congo"
	},
	{
		english: "Equatorial Guinea",
		french: "Guinée équatoriale"
	},
	{
		english: "Gabon",
		french: "Gabon"
	},
	{
		english: "Republic of Congo",
		french: "République du Congo"
	},
	{
		english: "Sao Tome and Principe",
		french: "Sao Tomé-et-Principe"
	},
	{
		english: "Burundi",
		french: "Burundi"
	},
	{
		english: "Comoros",
		french: "Comores"
	},
	{
		english: "Djibouti",
		french: "Djibouti"
	},
	{
		english: "Eritrea",
		french: "Érythrée"
	},
	{
		english: "Ethiopia",
		french: "Éthiopie "
	},
	{
		english: "Kenya",
		french: "Kenya"
	},
	{
		english: "Madagascar",
		french: "Madagascar"
	},
	{
		english: "Malawi",
		french: "Malawi"
	},
	{
		english: "Mauritius",
		french: "Maurice"
	},
	{
		english: "Mayotte",
		french: "Mayotte"
	},
	{
		english: "Mozambique",
		french: "Mozambique"
	},
	{
		english: "Réunion",
		french: "La Réunion"
	},
	{
		english: "Rwanda",
		french: "Rwanda"
	},
	{
		english: "Seychelles",
		french: "Seychelles"
	},
	{
		english: "Somalia",
		french: "Somalie"
	},
	{
		english: "South Sudan",
		french: "Soudan du Sud"
	},
	{
		english: "Tanzania",
		french: "Ouganda"
	},
	{
		english: "Uganda",
		french: "Tanzanie"
	},
	{
		english: "Zambia",
		french: "Zambie"
	},
	{
		english: "Zimbabwe",
		french: "Zimbabwe"
	},
	{
		english: "Botswana",
		french: "Botswana"
	},
	{
		english: "Lesotho",
		french: "Lesotho"
	},
	{
		english: "Namibia",
		french: "Namibie"
	},
	{
		english: "South Africa",
		french: "Afrique du Sud"
	},
	{
		english: "Swaziland",
		french: "Swaziland"
	},
	{
		english: "Benin",
		french: "Bénin"
	},
	{
		english: "Burkina Faso",
		french: "Burkina Faso"
	},
	{
		english: "Cape Verde",
		french: "Cabo Verde"
	},
	{
		english: "Côte d’Ivoire",
		french: "Côte d'Ivoire"
	},
	{
		english: "Gambia",
		french: "Gambie"
	},
	{
		english: "Ghana",
		french: "Ghana"
	},
	{
		english: "Guinea",
		french: "Guinée"
	},
	{
		english: "Guinea-Bissau",
		french: "Guinée-Bissau"
	},
	{
		english: "Liberia",
		french: "Libéria"
	},
	{
		english: "Mali",
		french: "Mali"
	},
	{
		english: "Mauritania",
		french: "Mauritanie"
	},
	{
		english: "Niger",
		french: "Niger"
	},
	{
		english: "Nigeria",
		french: "Nigéria"
	},
	{
		english: "Saint Helena",
		french: "Sainte-Hélène"
	},
	{
		english: "Senegal",
		french: "Sénégal"
	},
	{
		english: "Sierra Leone",
		french: "Sierra Leone"
	},
	{
		english: "Togo",
		french: "Togo"
	}
]

# Function to only add unique values
countries_list.each do |s|
	Country.find_or_create_by(english: s[:english], french: s[:french] )
end








