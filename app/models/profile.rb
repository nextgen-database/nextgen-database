class Profile < ApplicationRecord

	validates :firstname, presence: true

	has_many :profile_sectors
	has_many :sectors, through: :profile_sectors

	has_many :profile_demographics
	has_many :demographics, through: :profile_demographics

	has_many :profile_development_actors
	has_many :development_actors, through: :profile_development_actors

	has_many :profile_research_methods
	has_many :research_methods, through: :profile_research_methods

	has_many :profile_countries
	has_many :countries, through: :profile_countries

	has_many :profile_subregions
	has_many :subregions, through: :profile_subregions

	has_many :profile_regions
	has_many :regions, through: :profile_regions

	has_many :affiliations, inverse_of: :profile

	has_many :positions, through: :affiliations

	has_many :profile_requests, dependent: :destroy

	has_many :profile_sustainable_development_goals
	has_many :sustainable_development_goals, through: :profile_sustainable_development_goals

	belongs_to :prefix, optional: true

	belongs_to :user, optional: true

	# This is for the cocoon gem and nested forms
	accepts_nested_attributes_for :affiliations, reject_if: :all_blank, allow_destroy: true


	def full_name
		"#{firstname} #{middlename} #{lastname}"
	end


	#
	# Setup scopes for search
	#
	#scope :sustainable_development_goal, -> (sustainable_development_goal_id) {
	#	where sustainable_development_goal_id: sustainable_development_goal_id unless sustainable_development_goal_id.blank? }

	#scope :sustainable_development_goal, -> (sustainable_development_goal_id) {
	#	joins(:sustainable_development_goal).
	#		where(sustainable_development_goal_id: sustainable_development_goal_id unless sustainable_development_goal_id.blank?)
	#}

	# https://blog.carbonfive.com/2016/11/16/rails-database-best-practices/
	# http://oncodesign.io/2013/07/24/the-rails-way-to-search-filtering/
	# http://codeatmorning.com/rails-5-meet-the-active-record-or-query/






	scope :sustainable_development_goal, -> (sustainable_development_goal) {
		joins(:sustainable_development_goals)
			.where(sustainable_development_goals: {id: sustainable_development_goal})
	}



	# Add pound it to the bloody array values
	#

	scope :where_id, -> (id) do
		where("id ILIKE ANY (array[?])", id.map {|val| "%#{val}%" }) unless id.blank?
	end

	scope :where_firstname, -> (query) do
		where("firstname ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }) unless query.blank?
	end

	scope :where_middlename, -> (query) do
		where("middlename ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }) unless query.blank?
	end

	scope :where_lastname, -> (query) do
		where("lastname ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }) unless query.blank?
	end

	scope :where_sustainable_development_goals, -> (query) do
		joins(:sustainable_development_goals).
			where("sustainable_development_goals.banner_en ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }).
				or(joins(:sustainable_development_goals).where("sustainable_development_goals.banner_fr ILIKE ANY (array[?])", query.map {|val| "%#{val}%" })) unless query.blank?
	end

	scope :where_organisations, -> (query) do
		joins("JOIN affiliations ON profiles.id = affiliations.profile_id").
			joins("JOIN organisations on affiliations.organisation_id = organisations.id").
				where("organisations.english ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }) unless query.blank?
	end

	scope :where_organisations_fr, -> (query) do
		joins("JOIN affiliations ON profiles.id = affiliations.profile_id").
			joins("JOIN organisations on affiliations.organisation_id = organisations.id").
				where("organisations.french ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }) unless query.blank?
	end

	scope :where_organisation_abbreviations, -> (query) do
		joins("JOIN affiliations ON profiles.id = affiliations.profile_id").
			joins("JOIN organisations on affiliations.organisation_id = organisations.id").
				where("organisations.abbreviation_en ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }) unless query.blank?
	end

	scope :where_organisation_abbreviations_fr, -> (query) do
		joins("JOIN affiliations ON profiles.id = affiliations.profile_id").
			joins("JOIN organisations on affiliations.organisation_id = organisations.id").
				where("organisations.abbreviation_fr ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }) unless query.blank?
	end


	scope :where_titles, -> (query) do
		joins("JOIN affiliations ON profiles.id = affiliations.profile_id").
			joins("JOIN affiliation_positions ON affiliations.id = affiliation_positions.affiliation_id").
				joins("JOIN titles ON titles.id = affiliation_positions.position_id").
					where("titles.english ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }) unless query.blank?
	end

	scope :where_titles_fr, -> (query) do
		joins("JOIN affiliations ON profiles.id = affiliations.profile_id").
			joins("JOIN affiliation_positions ON affiliations.id = affiliation_positions.affiliation_id").
				joins("JOIN titles ON titles.id = affiliation_positions.position_id").
					where("titles.french ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }) unless query.blank?
	end


	scope :where_research_methods, -> (query) do
		joins(:research_methods).
			where("research_methods.english ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }).
				or(joins(:research_methods).where("research_methods.french ILIKE ANY (array[?])", query.map {|val| "%#{val}%" })) unless query.blank?
	end

	scope :where_research_method_ids, -> (research_method_ids) do
		joins(:research_methods).
			where(research_methods: {id: research_method_ids }) unless research_method_ids.blank?
	end

	scope :where_sectors, -> (query) do
		joins(:sectors).
			where("sectors.english ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }).
				or(joins(:sectors).where("sectors.french ILIKE ANY (array[?])", query.map {|val| "%#{val}%" })) unless query.blank?
	end

	scope :where_sector_ids, -> (sector_ids) do
		joins(:sectors).
			where(sectors: {id: sector_ids }) unless sector_ids.blank?
	end

	scope :where_demographics, -> (query) do
		joins(:demographics).
			where("demographics.english ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }).
				or( joins(:demographics).where("demographics.french ILIKE ANY (array[?])", query.map {|val| "%#{val}%" })) unless query.blank?
	end

	scope :where_demographic_ids, -> (demographic_ids) do
		joins(:demographics).
			where(demographics: {id: demographic_ids }) unless demographic_ids.blank?
	end

	scope :where_development_actors, -> (query) do
		joins(:development_actors).
			where("development_actors.english ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }).
				or( joins(:development_actors).where("development_actors.french ILIKE ANY (array[?])", query.map {|val| "%#{val}%" })) unless query.blank?
	end

	scope :where_countries, -> (query) do
		joins(:countries).
			where("countries.english ILIKE ANY (array[?])", query.map {|val| "%#{val}%" }).
				or(joins(:countries).where("countries.french ILIKE ANY (array[?])", query.map {|val| "%#{val}%" })) unless query.blank?
	end

	scope :where_development_actor_ids, -> (development_actor_ids) do
		joins(:development_actors).
			where(development_actors: {id: development_actor_ids }) unless development_actor_ids.blank?
	end

	scope :where_country_ids, -> (country_ids) do
		joins(:countries).
			where(countries: {id: country_ids }) unless country_ids.blank?
	end

	scope :where_region_ids, -> (region_ids) do
		joins(:regions).
			where(regions: {id: region_ids }) unless region_ids.blank?
	end

	scope :where_subregion_ids, -> (subregion_ids) do
		joins(:subregions).
			where(subregions: {id: subregion_ids }) unless subregion_ids.blank?
	end

	scope :where_organisation_ids, -> (organisation_ids) do
		joins("JOIN affiliations ON profiles.id = affiliations.profile_id").
			joins("JOIN organisations on affiliations.organisation_id = organisations.id").
				where(organisations: {id: organisation_ids }) unless organisation_ids.blank?
	end

	scope :where_organisation_type_ids, -> (organisation_type_ids) do
		joins("JOIN affiliations ON profiles.id = affiliations.profile_id").
			joins("JOIN organisations on affiliations.organisation_id = organisations.id").
				joins("JOIN organisation_types ON organisation_types.id = organisations.organisation_type_id").
					where(organisation_types: {id: organisation_type_ids }) unless organisation_type_ids.blank?
	end

	scope :where_province_ids, -> (province_ids) do
		joins("JOIN affiliations ON profiles.id = affiliations.profile_id").
			joins("JOIN organisations on affiliations.organisation_id = organisations.id").
				joins("JOIN provinces ON provinces.id = organisations.province_id").
					where(provinces: {id: province_ids }) unless province_ids.blank?
	end


	#
	# Search
	# Take the array of queries and check through all of the profiles for matching
	#  patterns
	#
	# Different Search States
	# State 0: Nothing supplied
	# State 1: Search Query Supplied and default SDG
	# State 2: SDG filter but no Search Query
	# State 3: Filters Applied
	#
	def self.search(search_parameters)

		profiles = Array.new(0)

		# Check if there are any search parameters
		# If there are no search parameters set return all profiles
		if search_parameters.blank?
			profiles = Profile.all
		else
			profiles = search_logic(search_parameters)

			#profiles = filter_by_query(search_parameters['query'])





		end

		#profiles = profiles | filter_by_query(search_parameters['query']) if !search_parameters['query'].blank
		#profiles = filter_by_primary_sdg(search_parameters['primary_sdg'], profiles) if !search_parameters['primary_sdg'].blank


	end

	# Filter the list of ids of profiles by
	# the supplied query
	#
	# Only search the following:
	# 	- sectors
	# 	- sdgs
	#	- countries
	# 	- demopgraphics
	#	- First, Middle, Last name
	#
	# TODO: Optimise code
	#
	def self.filter_by_search_query(query, ids)

		result_ids = Array.new

		# Search all of the profile information
		result_ids = Profile.where(nil).where_firstname(query).or(where_middlename(query)).or(where_lastname(query)).where(id: ids).pluck(:id)

		# Search Sectors
		result_ids = result_ids | Profile.where(nil).where_sectors(query).where(id: ids).pluck(:id)

		# Search Sustainable Development Goals
		result_ids = result_ids | Profile.where(nil).where_sustainable_development_goals(query).where(id: ids).pluck(:id) if !query.blank?

		# Search Demographics
		result_ids = result_ids | Profile.where(nil).where_demographics(query).where(id: ids).pluck(:id) if !query.blank?

		# Search Countries
		result_ids = result_ids | Profile.where(nil).where_countries(query).where(id: ids).pluck(:id) if !query.blank?

		# Search Development Actors
		result_ids = result_ids | Profile.where(nil).where_development_actors(query).where(id: ids).pluck(:id) if !query.blank?

		# Search Organisations
		result_ids = result_ids | Profile.where(nil).where_organisations(query).where(id: ids).pluck(:id) if !query.blank?
		result_ids = result_ids | Profile.where(nil).where_organisations_fr(query).where(id: ids).pluck(:id) if !query.blank?

		# Search Organisation Abbreviations
		result_ids = result_ids | Profile.where(nil).where_organisation_abbreviations(query).where(id: ids).pluck(:id) if !query.blank?
		result_ids = result_ids | Profile.where(nil).where_organisation_abbreviations_fr(query).where(id: ids).pluck(:id) if !query.blank?

		# Search Titles
		result_ids = result_ids | Profile.where(nil).where_titles(query).where(id: ids).pluck(:id) if !query.blank?
		result_ids = result_ids | Profile.where(nil).where_titles_fr(query).where(id: ids).pluck(:id) if !query.blank?

		# Search Research Methods
		result_ids = result_ids | Profile.where(nil).where_research_methods(query).where(id: ids).pluck(:id) if !query.blank?

	end


	def self.filter_by_primary_sdg(primary_sdg, ids)

		result_ids = Array.new

		# Search Sustainable Development Goals
		result_ids = Profile.where(id: ids).sustainable_development_goal(primary_sdg).pluck(:id) if !primary_sdg.blank?

	end

	def self.filter_by_sector_ids(sector_ids, ids)

		result_ids = Array.new

		# Search Sector IDs
		result_ids = Profile.where(id: ids).where_sector_ids(sector_ids).pluck(:id) if !sector_ids.blank?

	end

	def self.filter_by_demographic_ids(demographic_ids, ids)

		result_ids = Array.new

		# Search Demographic IDs
		result_ids = Profile.where(id: ids).where_demographic_ids(demographic_ids).pluck(:id) if !demographic_ids.blank?

	end

	def self.filter_by_development_actor_ids(development_actor_ids, ids)

		result_ids = Array.new

		# Search Development Actor IDs
		result_ids = Profile.where(id: ids).where_development_actor_ids(development_actor_ids).pluck(:id) if !development_actor_ids.blank?

	end

	def self.filter_by_research_method_ids(research_method_ids, ids)

		result_ids = Array.new

		# Search Development Actor IDs
		result_ids = Profile.where(id: ids).where_research_method_ids(research_method_ids).pluck(:id) if !research_method_ids.blank?

	end

	def self.filter_by_country_ids(country_ids, ids)

		result_ids = Array.new

		# Search Country IDs
		result_ids = Profile.where(id: ids).where_country_ids(country_ids).pluck(:id) if !country_ids.blank?

	end

	def self.filter_by_region_ids(region_ids, ids)

		result_ids = Array.new

		# Search Country IDs
		result_ids = Profile.where(id: ids).where_region_ids(region_ids).pluck(:id) if !region_ids.blank?

	end

	def self.filter_by_subregion_ids(subregion_ids, ids)

		result_ids = Array.new

		# Search Country IDs
		result_ids = Profile.where(id: ids).where_subregion_ids(subregion_ids).pluck(:id) if !subregion_ids.blank?

	end

	def self.filter_by_organisation_ids(organisation_ids, ids)

		result_ids = Array.new

		# Search Country IDs
		result_ids = Profile.where(id: ids).where_organisation_ids(organisation_ids).pluck(:id) if !organisation_ids.blank?

	end

	def self.filter_by_organisation_type_ids(organisation_type_ids, ids)

		result_ids = Array.new

		# Search Country IDs
		result_ids = Profile.where(id: ids).where_organisation_type_ids(organisation_type_ids).pluck(:id) if !organisation_type_ids.blank?

	end

	def self.filter_by_province_ids(province_ids, ids)

		result_ids = Array.new

		# Search Country IDs
		result_ids = Profile.where(id: ids).where_province_ids(province_ids).pluck(:id) if !province_ids.blank?

	end




	def self.search_logic(search_parameters)


		results = Array.new(0)

		# Check the if the query text even exists
		if search_parameters.has_key?('query')

			# As long as the query text is not blank
			if !search_parameters['query'].blank?
				results = search_by_query(search_parameters['query'])
			# If the query text is blank then we need to start with the full list of profiles
			else
				results = Profile.all
			end

		# if no query is supplied then we start with all of the profiles in the database
		else
			results = Profile.all
		end

		# Filter by primary sdg if it is set
		if !search_parameters.has_key?('primary_sdg')

			primary_sdg_ids = Array.new(0)

			# Get the Results and filter the results based on the value of primary_sdg


			# Get the IDs of the current result set
			results.each do |r|
				primary_sdg_ids.push(r.id)
			end

			logger.debug primary_sdg_ids
			# Filter this result set based on the SDGs that are in the primary filter



		end

		results

	end


end
