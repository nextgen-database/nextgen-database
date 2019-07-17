# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

prefix_list = [
	{
		english: "Dr.",
		french: "Dr"
	},
	{
		english: "Mr.",
		french: "M."
	},
	{
		english: "Mrs.",
		french: "Mme",
	},
	{
		english: "Ms.",
		french: "Mlle"
	},
	{
		english: "The Right Honourable",
		french: "The Right Honourable"
	}
]

# Function to only add unique values
prefix_list.each do |s|
	Prefix.find_or_create_by(english: s[:english], french: s[:french] )
end
