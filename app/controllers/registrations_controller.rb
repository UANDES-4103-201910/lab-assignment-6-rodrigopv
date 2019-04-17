class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
            puts "creating user..."
            puts user_params
            @user = User.create(user_params)
            puts @user.inspect
            if @user.save
               flash[:notice] = "User has been created"
               redirect_to log_in_path
            else
               flash[:notice] = "Create User failed..."
               render :new
            end
	end

   private
     def user_params
       params['registrations'].permit( :name, :last_name, :email, :phone, :password)
     end
end
