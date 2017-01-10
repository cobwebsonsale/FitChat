class MessagesController < BaseController
	def new
		@session_id = params[:session_id]
		if @session_id.nil?
			@session = Session.new(:user_to_id => Constants::BROADCAST_USER, :user_from_id => current_user.id)
			@save_session = true
		else
			@save_session = false
			@session = Session.find(@session_id)
			if @session.user_to_id == Constants::BROADCAST_USER
				@session.user_to_id = current_user.id
				@save_session = true
			end
		end
		@message = @session.messages.new
	end

	def edit
	end

	def create
		@session_id = message_params[:session_id]
		if @session_id.nil?
			@session = Session.new(:user_to_id => Constants::BROADCAST_USER, :user_from_id => current_user.id)
			@save_session = true
		else
			@save_session = false
			@session = Session.find(@session_id)
			if @session.user_to_id == Constants::BROADCAST_USER
				@session.user_to_id = current_user.id
				@save_session = true
			end
		end
		
		if @save_session
			if @session.save
				message_params[:session_id] = @session.id
			else 
				render action: 'new'
			end
		end

		@message = @session.messages.new(message_params)
		if @message.save 
			redirect_to root_url, notice: 'message was successfully posted.'
		else
	  		render action: 'new'
		end

	end

	private
	def message_params
      params.require(:message).permit(:text, :session_id, :author)
    end
end
