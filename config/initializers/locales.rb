# Load locales from RAILS_ROOT/lib/locale directory into Rails
# I18n.backend.populate do
#   Dir[ File.join(RAILS_ROOT, 'lib', 'locale', '*.rb') ].each { |l| require l }
# end

# I18n.populate do
#   Dir[ File.join(RAILS_ROOT, 'lib', 'locale', '*.rb') ].each do |file| 
#     I18n.load_translations file
#   end
# end

I18n.populate do
  I18n.load_translations "#{RAILS_ROOT}/lib/locale/cz.rb"
  I18n.load_translations "#{RAILS_ROOT}/lib/locale/de.yml"
end