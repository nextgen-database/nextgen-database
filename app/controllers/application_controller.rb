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

end
