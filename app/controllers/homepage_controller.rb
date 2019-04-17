class HomepageController < ApplicationController
 def show
   if session[:current_id]
      puts "User ID: "
      puts session[:current_id]
      @user = User.find(session[:current_id])
   end
 end

end
