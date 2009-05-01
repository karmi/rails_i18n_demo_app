# Load locales from RAILS_ROOT/locales directory into Rails
I18n.load_path += Dir[ File.join(RAILS_ROOT, 'locales', '*.{rb,yml}') ]
