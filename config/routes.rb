Rails.application.routes.draw do

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
	end

	root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root

	get "/*path", to: redirect("/#{I18n.default_locale}/%{path}", status: 302), constraints: {path: /(?!(#{I18n.available_locales.join("|")})\/).*/}, format: false

	#scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do
    #	root to: redirect("/%{locale}/static_pages#home", status: 302)
  	#end

#    scope "(:locale)", locale: /en|de/ do
#        root 'static_pages#home'
#    end

    #get  'static_pages/about'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




end
