# Load locales from RAILS_ROOT/lib/locale directory into Rails
# Dir[ File.join(RAILS_ROOT, 'lib', 'locale', '*.rb') ].each { |l| require l }

# will be populated to the simple backend
I18n.load_translations "#{RAILS_ROOT}/lib/locale/cz.rb"
I18n.load_translations "#{RAILS_ROOT}/lib/locale/de.yml"
I18n.load_translations "#{RAILS_ROOT}/lib/locale/en-US.yml"
