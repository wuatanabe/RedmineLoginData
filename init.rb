require 'redmine'
require 'log_login_patch'

Redmine::Plugin.register :redmine_logindata do
  name 'Redmine Logindata plugin'
  author 'Wuatanabe'
  description 'Wrap Login and similar account related actions, in order to log more info.'
  version '0.1.0'
  url 'https://github.com/wuatanabe/RedmineLoginData'
  author_url 'https://github.com/wuatanabe'
end

