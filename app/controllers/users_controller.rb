class UsersController < ApplicationController
  def new
  	@User = User.new
  end

  def show
    @user = current_user
  end

  def index
  	@Users = User.all    
  end


  def create
  	@user = User.new(user_params)

  	if @user.save
  		render text: "New users created"
  	else
  		render 'new'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email,:password,:password_confirmation)
  end

end
