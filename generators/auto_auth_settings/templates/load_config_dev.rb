if File.exists?( "#{RAILS_ROOT}/config/settings_dev.yml" )
  DEV_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/settings_dev.yml")[RAILS_ENV].symbolize_keys
end
