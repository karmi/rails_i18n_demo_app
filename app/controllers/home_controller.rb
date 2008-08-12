class HomeController < ApplicationController

  def index
    @good_bye = I18n.t( :good_bye, :default => 'Good bye!' )
  end

end
