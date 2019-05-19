Rails.application.routes.draw do

  	devise_for :users
	#
    # Use the following resource to sort out routes
    # https://dhampik.com/blog/rails-routes-tricks-with-locales
    #
	#
	# TODO: Figure out how to translate home and about page names
	#

	scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do
		root to: redirect("/%{locale}/home", status: 302)
		get '/profiles', to: 'profiles#index', as: 'profiles'
		get '/home', to: 'static_pages#home', as: 'home'
		get '/about', to: 'static_pages#about', as: 'about'



		# SETUP THE ADMIN SECTION
		# https://everydayrails.com/2012/07/31/rails-admin-panel-from-scratch.html
		# https://roberteshleman.com/blog/2014/08/14/using-rails-namespaces-for-admin-actions/
		#
		namespace :admin do
			get '', to: 'dashboard#index', as: '/'
			resources :sectors
		end


	end

	root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root

	get "/*path", to: redirect("/#{I18n.default_locale}/%{path}", status: 302), constraints: {path: /(?!(#{I18n.available_locales.join("|")})\/).*/}, format: false




	# https://everydayrails.com/2012/07/31/rails-admin-panel-from-scratch.html
	# https://roberteshleman.com/blog/2014/08/14/using-rails-namespaces-for-admin-actions/
	#


	#devise_for :admins, path: 'admin', skip: :registrations


	#scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do
    #	root to: redirect("/%{locale}/static_pages#home", status: 302)
  	#end

#    scope "(:locale)", locale: /en|de/ do
#        root 'static_pages#home'
#    end

    #get  'static_pages/about'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




end
