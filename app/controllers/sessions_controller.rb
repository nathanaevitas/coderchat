class SessionsController < ApplicationController
  def new   
  end

  def create
  	user = User.find_by_email(params[:session][:email])
  	if user && user.authenticate(params[:session][:password])      
      session[:user_id] = user.id  		
      redirect_to profile_path, flash: {notice: "You have logged in"} 		
  	else  		
  		render "new"
  	end
  end 

  def destroy
    session.clear
    redirect_to log_in_path, flash: {notice: "You have logged out"}
  end
end
