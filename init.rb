require 'redmine'

require 'log_login_patch'

Redmine::Plugin.register :redmine_logindata do
  name 'Redmine Logindata plugin'
  author 'Paolo Freuli'
  description 'On Login and related actions, logs both IP and USERNAME'
  version '0.2.0'
  url 'https://github.com/wuatanabe/RedmineLoginData'
  author_url 'https://github.com/wuatanabe'
end

puts "*"*30
puts "Loading Logindata"
puts "*"*30