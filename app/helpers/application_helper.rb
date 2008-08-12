# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # Convenience method for I18n.translate
  def t(*args)
    translate(*args)
  end
  
end
