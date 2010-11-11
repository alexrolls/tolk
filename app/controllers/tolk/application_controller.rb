module Tolk
  class ApplicationController < ActionController::Base
    helper :all
    protect_from_forgery

    cattr_accessor :authenticator
    before_filter :authenticate

    def authenticate
      authenticate_user!
    end

    def ensure_no_primary_locale
      redirect_to tolk_locales_path if @locale.primary?
    end
  end
end
