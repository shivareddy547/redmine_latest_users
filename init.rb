
require 'redmine'

require_dependency 'latest_users/view_hook_listener'
require_dependency 'latest_users/settings_override_patch'
require_dependency File.expand_path(File.join(File.dirname(__FILE__), 'app/controllers/latest_users_setup_controller'))
#Setting.send(:include, SettingsOverridePatch)

Redmine::Plugin.register :latest_users do
  name 'Latest Users plugin'
  author 'Shivareddy'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  permission :li_setup, { :latest_users_setup => [:index, :change] }, :public => true
  menu :admin_menu, :latest_users_setup, {:controller => 'latest_users_setup', :action => 'index'}, :caption => 'Latest Users'
  settings :default => {'empty' => true}, :partial => 'settings/setup'


end


SettingsController.send(:include, SettingsOverridePatch)
