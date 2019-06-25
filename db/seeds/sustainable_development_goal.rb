# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

sustainable_development_goals_list = [
	{
		code: '1',
		banner_en: "No poverty",
		banner_fr: "No poverty",
		title_en: 'End poverty in all its forms everywhere',
		title_fr: 'End poverty in all its forms everywhere',
		description_en: 'Goal 1 calls for an end to poverty in all its manifestations, including extreme poverty, over the next 15 years. All people everywhere, including the poorest and most vulnerable, should enjoy a basic standard of living and social protection benefits.',
		description_fr: 'Goal 1 calls for an end to poverty in all its manifestations, including extreme poverty, over the next 15 years. All people everywhere, including the poorest and most vulnerable, should enjoy a basic standard of living and social protection benefits.'
	},
	{
		code: '2',
		banner_en: "Zero hunger",
		banner_fr: "Zero hunger",
		title_en: 'End hunger, achieve food security and improved nutrition and promote sustainable agriculture',
		title_fr: 'End hunger, achieve food security and improved nutrition and promote sustainable agriculture',
		description_en: 'Goal 2 seeks to end hunger and all forms of malnutrition and to achieve sustainable food production by 2030. It is premised on the idea that everyone should have access to sufficient nutritious food, which will require widespread promotion of sustainable agriculture, a doubling of agricultural productivity, increased investments and properly functioning food markets.',
		description_fr: 'Goal 2 seeks to end hunger and all forms of malnutrition and to achieve sustainable food production by 2030. It is premised on the idea that everyone should have access to sufficient nutritious food, which will require widespread promotion of sustainable agriculture, a doubling of agricultural productivity, increased investments and properly functioning food markets.'
	},
	{
		code: '3',
		banner_en: "Good health and well-being",
		banner_fr: "Good health and well-being",
		title_en: 'Ensure healthy lives and promote well-being for all at all ages',
		title_fr: 'Ensure healthy lives and promote well-being for all at all ages',
		description_en: 'Goal 3 aims to ensure health and well-being for all at all ages by improving reproductive, maternal and child health; ending the epidemics of major communicable diseases; reducing non-communicable and environmental diseases; achieving universal health coverage; and ensuring access to safe, affordable and effective medicines and vaccines for all.',
		description_fr: 'Goal 3 aims to ensure health and well-being for all at all ages by improving reproductive, maternal and child health; ending the epidemics of major communicable diseases; reducing non-communicable and environmental diseases; achieving universal health coverage; and ensuring access to safe, affordable and effective medicines and vaccines for all.'
	},
	{
		code: '4',
		banner_en: "Quality education",
		banner_fr: "Quality education",
		title_en: 'Ensure inclusive and equitable quality education and promote lifelong learning opportunities for all',
		title_fr: 'Ensure inclusive and equitable quality education and promote lifelong learning opportunities for all',
		description_en: 'Goal 4 focuses on the acquisition of foundational and higher-order skills; greater and more equitable access to technical and vocational education and training and higher education; training throughout life; and the knowledge, skills and values needed to function well and contribute to society.',
		description_fr: 'Goal 4 focuses on the acquisition of foundational and higher-order skills; greater and more equitable access to technical and vocational education and training and higher education; training throughout life; and the knowledge, skills and values needed to function well and contribute to society.'
	},
	{
		code: '5',
		banner_en: "Gender equality",
		banner_fr: "Gender equality",
		title_en: 'Achieve gender equality and empower all women and girls',
		title_fr: 'Achieve gender equality and empower all women and girls',
		description_en: 'Goal 5 aims to empower women and girls to reach their full potential, which requires eliminating all forms of discrimination and violence against them, including harmful practices. It seeks to ensure that they have every opportunity for sexual and reproductive health and reproductive rights; receive due recognition for their unpaid work; have full access to productive resources; and enjoy equal participation with men in political, economic and public life.',
		description_fr: 'Goal 5 aims to empower women and girls to reach their full potential, which requires eliminating all forms of discrimination and violence against them, including harmful practices. It seeks to ensure that they have every opportunity for sexual and reproductive health and reproductive rights; receive due recognition for their unpaid work; have full access to productive resources; and enjoy equal participation with men in political, economic and public life.'
	},
	{
		code: '6',
		banner_en: "Clean water and sanitation",
		banner_fr: "Clean water and sanitation",
		title_en: 'Ensure availability and sustainable management of water and sanitation for all',
		title_fr: 'Ensure availability and sustainable management of water and sanitation for all',
		description_en: 'Goal 6 goes beyond drinking water, sanitation and hygiene to also address the quality and sustainability of water resources. Achieving this Goal, which is critical to the survival of people and the planet, means expanding international cooperation and garnering the support of local communities in improving water and sanitation management.',
		description_fr: 'Goal 6 goes beyond drinking water, sanitation and hygiene to also address the quality and sustainability of water resources. Achieving this Goal, which is critical to the survival of people and the planet, means expanding international cooperation and garnering the support of local communities in improving water and sanitation management.'
	},
	{
		code: '7',
		banner_en: "Affordable and clean energy",
		banner_fr: "Affordable and clean energy",
		title_en: 'Ensure access to affordable, reliable, sustainable and modern energy for all',
		title_fr: 'Ensure access to affordable, reliable, sustainable and modern energy for all',
		description_en: 'Goal 7 seeks to promote broader energy access and increased use of renewable energy, including through enhanced international cooperation and expanded infrastructure and technology for clean energy.',
		description_fr: 'Goal 7 seeks to promote broader energy access and increased use of renewable energy, including through enhanced international cooperation and expanded infrastructure and technology for clean energy.'
	},
	{
		code: '8',
		banner_en: "Decent work and economic growth",
		banner_fr: "Decent work and economic growth",
		title_en: 'Promote sustained, inclusive and sustainable economic growth, full and productive employment and decent work for all',
		title_fr: 'Promote sustained, inclusive and sustainable economic growth, full and productive employment and decent work for all',
		description_en: 'Goal 8 aims to provide opportunities for full and productive employment and decent work for all while eradicating forced labour, human trafficking and child labour.',
		description_fr: 'Goal 8 aims to provide opportunities for full and productive employment and decent work for all while eradicating forced labour, human trafficking and child labour.'
	},
	{
		code: '9',
		banner_en: "Industry, innovation and infrastructure",
		banner_fr: "Industry, innovation and infrastructure",
		title_en: 'Build resilient infrastructure, promote inclusive and sustainable industrialization and foster innovation',
		title_fr: 'Build resilient infrastructure, promote inclusive and sustainable industrialization and foster innovation',
		description_en: 'Goal 9 focuses on the promotion of infrastructure development, industrialization and innovation. This can be accomplished through enhanced international and domestic financial, technological and technical support, research and innovation, and increased access to information and communication technology.',
		description_fr: 'Goal 9 focuses on the promotion of infrastructure development, industrialization and innovation. This can be accomplished through enhanced international and domestic financial, technological and technical support, research and innovation, and increased access to information and communication technology.'
	},
	{
		code: '10',
		banner_en: "Reduced inequalities",
		banner_fr: "Reduced inequalities",
		title_en: 'Reduce inequality within and among countries',
		title_fr: 'Reduce inequality within and among countries',
		description_en: 'Goal 10 calls for reducing inequalities in income, as well as those based on sex, age, disability, race, class, ethnicity, religion and opportunity—both within and among countries. It also aims to ensure safe, orderly and regular migration and addresses issues related to representation of developing countries in global decision-making and development assistance.',
		description_fr: 'Goal 10 calls for reducing inequalities in income, as well as those based on sex, age, disability, race, class, ethnicity, religion and opportunity—both within and among countries. It also aims to ensure safe, orderly and regular migration and addresses issues related to representation of developing countries in global decision-making and development assistance.'
	},
	{
		code: '11',
		banner_en: "Sustainable cities and communities",
		banner_fr: "Sustainable cities and communities",
		title_en: 'Make cities and human settlements inclusive, safe, resilient and sustainable',
		title_fr: 'Make cities and human settlements inclusive, safe, resilient and sustainable',
		description_en: 'Goal 11 aims to renew and plan cities and other human settlements in a way that fosters community cohesion and personal security while stimulating innovation and employment.',
		description_fr: 'Goal 11 aims to renew and plan cities and other human settlements in a way that fosters community cohesion and personal security while stimulating innovation and employment.'
	},
	{
		code: '12',
		banner_en: "Responsible consumption and production",
		banner_fr: "Responsible consumption and production",
		title_en: 'Ensure sustainable consumption and production patterns',
		title_fr: 'Ensure sustainable consumption and production patterns',
		description_en: 'Goal 12 aims to promote sustainable consumption and production patterns through measures such as specific policies and international agreements on the management of materials that are toxic to the environment.',
		description_fr: 'Goal 12 aims to promote sustainable consumption and production patterns through measures such as specific policies and international agreements on the management of materials that are toxic to the environment.'
	},
	{
		code: '13',
		banner_en: "Climate action",
		banner_fr: "Climate action",
		title_en: 'Take urgent action to combat climate change and its impacts',
		title_fr: 'Take urgent action to combat climate change and its impacts',
		description_en: 'Climate change presents the single biggest threat to development, and its widespread, unprecedented effects disproportionately burden the poorest and the most vulnerable. Urgent action is needed not only to combat climate change and its impacts, but also to build resilience in responding to climate-related hazards and natural disasters.',
		description_fr: 'Climate change presents the single biggest threat to development, and its widespread, unprecedented effects disproportionately burden the poorest and the most vulnerable. Urgent action is needed not only to combat climate change and its impacts, but also to build resilience in responding to climate-related hazards and natural disasters.'
	},
	{
		code: '14',
		banner_en: "Life below water",
		banner_fr: "Life below water",
		title_en: 'Conserve and sustainably use the oceans, seas and marine resources for sustainable development',
		title_fr: 'Conserve and sustainably use the oceans, seas and marine resources for sustainable development',
		description_en: 'Goal 14 seeks to promote the conservation and sustainable use of marine and coastal ecosystems, prevent marine pollution and increase the economic benefits to small island developing States and LDCs from the sustainable use of marine resources.',
		description_fr: 'Goal 14 seeks to promote the conservation and sustainable use of marine and coastal ecosystems, prevent marine pollution and increase the economic benefits to small island developing States and LDCs from the sustainable use of marine resources.'
	},
	{
		code: '15',
		banner_en: "Life on land",
		banner_fr: "Life on land",
		title_en: 'Protect, restore and promote sustainable use of terrestrial ecosystems, sustainably manage forests, combat desertification, and halt and reverse land degradation and halt biodiversity loss',
		title_fr: 'Protect, restore and promote sustainable use of terrestrial ecosystems, sustainably manage forests, combat desertification, and halt and reverse land degradation and halt biodiversity loss',
		description_en: 'Goal 15 focuses on managing forests sustainably, restoring degraded lands and successfully combating desertification, reducing degraded natural habitats and ending biodiversity loss. All of these efforts in combination will help ensure that livelihoods are preserved for those that depend directly on forests and other ecosystems, that biodiversity will thrive, and that the benefits of these natural resources will be enjoyed for generations to come.',
		description_fr: 'Goal 15 focuses on managing forests sustainably, restoring degraded lands and successfully combating desertification, reducing degraded natural habitats and ending biodiversity loss. All of these efforts in combination will help ensure that livelihoods are preserved for those that depend directly on forests and other ecosystems, that biodiversity will thrive, and that the benefits of these natural resources will be enjoyed for generations to come.'
	},
	{
		code: '16',
		banner_en: "Peace, justice and strong institutions",
		banner_fr: "Peace, justice and strong institutions",
		title_en: 'Promote peaceful and inclusive societies for sustainable development, provide access to justice for all and build effective, accountable and inclusive institutions at all levels',
		title_fr: 'Promote peaceful and inclusive societies for sustainable development, provide access to justice for all and build effective, accountable and inclusive institutions at all levels',
		description_en: 'Goal 16 envisages peaceful and inclusive societies based on respect for human rights, the rule of law, good governance at all levels, and transparent, effective and accountable institutions. Many countries still face protracted violence and armed conflict, and far too many people are poorly supported by weak institutions and lack access to justice, information and other fundamental freedoms.',
		description_fr: 'Goal 16 envisages peaceful and inclusive societies based on respect for human rights, the rule of law, good governance at all levels, and transparent, effective and accountable institutions. Many countries still face protracted violence and armed conflict, and far too many people are poorly supported by weak institutions and lack access to justice, information and other fundamental freedoms.'
	},
	{
		code: '17',
		banner_en: "Partnerships for the goals",
		banner_fr: "Partnerships for the goals",
		title_en: 'Strengthen the means of implementation and revitalize the Global Partnership for Sustainable Development',
		title_fr: 'Strengthen the means of implementation and revitalize the Global Partnership for Sustainable Development',
		description_en: 'The 2030 Agenda requires a revitalized and enhanced global partnership that mobilizes all available resources from Governments, civil society, the private sector, the United Nations system and other actors. Increasing support to developing countries, in particular LDCs, landlocked developing countries and small island developing States is fundamental to equitable progress for all.',
		description_fr: 'The 2030 Agenda requires a revitalized and enhanced global partnership that mobilizes all available resources from Governments, civil society, the private sector, the United Nations system and other actors. Increasing support to developing countries, in particular LDCs, landlocked developing countries and small island developing States is fundamental to equitable progress for all.'
	}
]


# Function to only add unique values
sustainable_development_goals_list.each do |s|
	SustainableDevelopmentGoal.find_or_create_by(
		code: s[:code],
		banner_en: s[:banner_en],
		banner_fr: s[:banner_fr],
		title_en: s[:title_en],
		title_fr: s[:title_fr],
		description_en: s[:description_en],
		description_fr: s[:description_fr] )
end