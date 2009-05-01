class ApplicationController < ActionController::Base
  
  protect_from_forgery # :secret => 'ec68099bdc19048d4423999a1a439f12'
    
  before_filter :set_locale
  
  helper_method :available_locales, :current_locale?, :current_page_path


  def set_locale
    logger.debug "* Available locales are: #{available_locales.inspect}"
    I18n.locale = extract_locale_from_params || extract_locale_from_tld || extract_locale_from_subdomain || I18n.default_locale
    logger.debug "* Locale set to '#{I18n.locale}'"
  end
  
  def available_locales
    I18n.available_locales.map(&:to_s).sort
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
    (available_locales.include? params[:locale].to_s) ? params[:locale] : nil
  end
  
  # Get locale code from request top-level domain (like http://application.it:3000)
  # You have to put something like:
  #   127.0.0.1 application.com
  #   127.0.0.1 application.cz
  #   127.0.0.1 application.sk
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    (available_locales.include? parsed_locale.to_s) ? parsed_locale  : nil
  end

  # Get locale code from request subdomain (like http://it.application.local:3000)
  # You have to put something like:
  #   127.0.0.1 gr.application.local
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    (available_locales.include? parsed_locale.to_s) ? parsed_locale  : nil
  end

end
