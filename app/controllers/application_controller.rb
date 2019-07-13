class ApplicationController < ActionController::Base

    # Config default locale handing
    # https://dev.to/morinoko/setting-up-i18n-for-rails-with-locales-from-url-params-38pg
    # We want the following paths:
    #       http://domain.com/en/stuff
    #       http://domain.com/fr/stuff
    #

    before_action :set_locale

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options
        { locale: I18n.locale }
	end

    # After someone signs in send them to the account page
    # TODO: If the user is an admin send them to the admin panel
	def after_sign_in_path_for(resource)
		stored_location_for(resource) || account_path
	end

end
