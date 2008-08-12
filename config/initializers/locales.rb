# Load locales from RAILS_ROOT/lib/locale directory into Rails
I18n.backend.populate do
  Dir[ File.join(RAILS_ROOT, 'lib', 'locale', '*.rb') ].each { |l| require l }
end