class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
	#complete this method
        if session[:current_id]
           User.find(session[:current_id])
        end
  end

  def is_user_logged_in?
	#complete this method
  	logged_in = false
        puts "is_user_logged_in?"
        if session[:current_id] 
     	  logged_in = true
          puts "user logged in..."
        end
	if logged_in then true else redirect_to root_path end 
  end
end
