require 'uri'

class ApplicationController < ActionController::Base
  
  protect_from_forgery # :secret => 'ec68099bdc19048d4423999a1a439f12'
    
  before_filter :set_locale
  
  helper_method :available_locales, :current_locale?, :current_page_path


  def set_locale
    I18n.locale = extract_locale_from_params || extract_locale_from_uri || 'en-US'
    logger.debug "Locale set to '#{I18n.locale}'"
  end
  
  def available_locales
    I18n.available_locales.map &:to_s
  end
  
  def current_locale?(l)
    l == I18n.locale
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
  def extract_locale_from_uri
    parsed_locale = URI.parse(request.url).host.split('.').last.gsub(/com/, 'en-US')
    (available_locales.include? parsed_locale) ? parsed_locale  : nil
  end
  
end
