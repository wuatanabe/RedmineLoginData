require 'redmine'

require 'log_login_patch'

Redmine::Plugin.register :redmine_logindata do
  name 'Redmine Logindata plugin'
  author 'Paolo Freuli'
  description 'On Login and related actions, log both ip and username'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

puts "*"*30
puts "Loading Logindata"
puts "*"*30