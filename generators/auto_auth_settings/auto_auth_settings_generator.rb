class AutoAuthSettingsGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
  end

  def manifest
    record do |m|
      m.file 'settings_dev.yml', 'config/settings_dev.yml'
      m.file 'load_config_dev.rb', 'config/initializers/load_config_dev.rb' 
    end
  end
end