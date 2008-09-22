# Load locales from RAILS_ROOT/lib/locale directory into Rails
# will be populated to the simple backend
I18n.load_path += Dir[ File.join(RAILS_ROOT, 'lib', 'locale', '*.{rb,yml}') ]
