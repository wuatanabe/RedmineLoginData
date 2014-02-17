require_dependency 'account_controller'

module AccountControllerPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :login, :msg1 
      alias_method_chain :successful_authentication, :msg2
      alias_method_chain :logout, :msg3 
      
      # Note: not managing login failure (already correctly managed in account_controller)
      # alias_method_chain :invalidcredential, :msg4
    end
  end
  
  module InstanceMethods
    
  
  def login_with_msg1
	if request.get?	  
		## When just loading the login form
		## puts "** GET **  Request IP is "+request.ip.to_s
	else
		## When submittiing login and password	
		logger.info "Login attempt with user '#{params[:username]}' from IP #{request.remote_ip} at #{Time.now.utc}"
	end
	login_without_msg1	  
		
	### this is login content method (called by login_without_log wrapped by login_with_log)
	#~ if request.get?    
	#~ logout_user
	#~
	#~ end
  end
  
  
def logout_with_msg3
begin
     logger.info "Logout received from user '#{User.current.login}' from IP #{request.remote_ip} at #{Time.now.utc}"
rescue => error
     logger.info "ERROR: User.current.login exception"
     logger.info "Logout received from IP #{request.remote_ip} at #{Time.now.utc}"
end
     logout_without_msg3  
end
    
def successful_authentication_with_msg2(user)
     logger.info "Login successful for user '#{params[:username]}' from IP #{request.remote_ip} at #{Time.now.utc}"
     successful_authentication_without_msg2(user)	  
end	


#### -Note: not managing login failure (already correctly managed in account_controller.inve
#~ def invalid_credentials
#~ puts "** Message.04 ** Invalid credential for user #{params[:username]} from IP  "+ request.ip.to_s + " at #{Time.now.to_s}" 
#~ invalidcredential_without_msg4  
#~ end	


  end
end

AccountController.send(:include, AccountControllerPatch)

