require_dependency 'account_controller'

module AccountControllerPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :login, :log 
    end
  end
  
  module InstanceMethods
    # Add some additional log to login 
  def login_with_log
	if request.get?	  
	## puts " ****  Loading login form: Request IP is "+request.ip.to_s
	else
	 logger.warn   "**01** Login attempt with user #{params[:username]} from "+ request.remote_ip.to_s +" at #{Time.now.utc}"
end
	# Wrapped original login method
	login_without_log	  
  end
    
  end
end

AccountController.send(:include, AccountControllerPatch)

