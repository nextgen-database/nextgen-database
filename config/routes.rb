Rails.application.routes.draw do

	# Devise authentication routes
	devise_for :users, controllers: { confirmations: 'confirmations' }

	#
    # Use the following resource to sort out routes
    # https://dhampik.com/blog/rails-routes-tricks-with-locales
    #
	#
	# TODO: Figure out how to translate home and about page names
	#

	scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do
		root to: redirect("/%{locale}/home", status: 302)
		# The home page
		get '/home', to: 'static_pages#home', as: 'home'

		# The about page
		get '/about', to: 'static_pages#about', as: 'about'

		# My Account page
		get '/account', to: 'account#index', as: 'account'

		# Everything to do with profiles
		resources :profiles

		# SETUP THE ADMIN SECTION
		# https://everydayrails.com/2012/07/31/rails-admin-panel-from-scratch.html
		# https://roberteshleman.com/blog/2014/08/14/using-rails-namespaces-for-admin-actions/
		#
		namespace :admin do

			# Dashboard Pages
			get '', to: 'dashboard#index', as: '/'
			get '/profile_requests', to: 'dashboard#profile_requests', as: '/profile_requests'
			get '/profile_management', to: 'dashboard#profile_management', as: '/profile_management'
			get '/user_management', to: 'dashboard#user_management', as: '/user_management'
			get '/vocabulary_management', to: 'dashboard#vocabulary_management', as: '/vocabulary_management'

			get '/profile_output', to: 'dashboard#profile_output', as: '/profile_output'


			# Controlled Vocabulary Pages
			resources :sectors
			resources :demographics
			resources :development_actors
			resources :research_methods
			resources :organisations
			resources :titles
			resources :sustainable_development_goals

			# Handle Profile Requests (from the user and the admin)
			resources :profile_requests

		end


	end

	root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root

	get "/*path", to: redirect("/#{I18n.default_locale}/%{path}", status: 302), constraints: {path: /(?!(#{I18n.available_locales.join("|")})\/).*/}, format: false

end
