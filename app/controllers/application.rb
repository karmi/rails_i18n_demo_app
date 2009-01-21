class ApplicationController < ActionController::Base
  
  protect_from_forgery # :secret => 'ec68099bdc19048d4423999a1a439f12'
    
  before_filter :set_locale
  
  helper_method :available_locales, :current_locale?, :current_page_path


  def set_locale
    logger.debug "* Available locales are: #{available_locales.inspect}"
    I18n.locale = extract_locale_from_params || extract_locale_from_tld || I18n.default_locale
    logger.debug "* Locale set to '#{I18n.locale}'"
  end
  
  def available_locales
    # I18n.backend.available_locales
    AVAILABLE_LOCALES
  end
  
  def current_locale?(l)
    l.to_sym == I18n.locale.to_sym
  end
  
  def current_page_path(options={})
    url_for( {:controller => self.controller_name, :action => self.action_name}.merge(options) )
  end
  
  private
  
  # Get locale from request parameters
  def extract_locale_from_params
    (available_locales.include? params[:locale]) ? params[:locale]  : nil
  end
  
  # Get locale code from request domain
  # You have to put something like:
  #   127.0.0.1 application.com
  #   127.0.0.1 application.cz
  #   127.0.0.1 application.sk
  # In your /etc/hosts file to try this out
  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    (available_locales.include? parsed_locale) ? parsed_locale  : nil
  end
  
end
