# Load locales from RAILS_ROOT/lib/locale directory into Rails
# will be populated to the simple backend
Dir[ File.join(RAILS_ROOT, 'lib', 'locale', '*.{rb,yml}') ].each { |l| I18n.load_translations l }
