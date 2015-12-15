class MessagesController < ApplicationController
	before_action :require_authenticate, only: [:index, :index2, :show, :new, :create]
  def index
  	@messages = Message.where(recipient: current_user)
  end

  def index2
    @messages = Message.where(sender: current_user)
  end

  def show
  end

  def new
  	@message = Message.new  	
  end

  def create  
      recipient = User.find(params[:message][:recipient])
      Message.create(sender: current_user, recipient: recipient, body: params[:message][:body])
      redirect_to messages_list_path, notice: 'message successfully sent.' 
  end
  
end
