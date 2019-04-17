class SessionsController < ApplicationController
	def new
            if session[:current_id]
               redirect_to root_path
            end
	end

	def create
		#complete this method
                @user = User.where(login_params).first
                # session[:user] = @user
                if @user
                  session[:current_id] = @user.id
                  puts "SESSION CREATED"
                  puts @user
                  flash[:notice] = "You are now logged in!"
                  redirect_to root_path
                else
                  flash[:notice] = "User not found"
                  redirect_to "/login"
                end
	end

	def destroy
		#complete this method
                puts "logged out"
                flash[:notice] = "You are now logged out!"
                session.delete(:current_id)
                redirect_to root_path
	end
    private
     def login_params
        params['session'].permit( :email, :password)
     end
end
