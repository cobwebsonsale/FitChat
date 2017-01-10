class Chat::ActiveController < ApplicationController
	def index
		if current_user.is_member
			@sessions = Session.where("status = ? and user_from_id = ?", Constants::SESSION_STATUS_OPEN, current_user.id).order(updated_at: :desc)
		elsif current_user.is_trainer
			@sessions = Session.where("status = ? and user_to_id = ?", Constants::SESSION_STATUS_OPEN, current_user.id).order(updated_at: :desc)
		end
	end

	def edit
		@session_id = params[:id]
		@session = Session.find(@session_id)

		if @session.nil?
			redirect_to chat_active_index_path, notice: 'Chat thread not found.'
		end

		if @session.user_to_id == current_user.id or @session.user_from_id == current_user.id
			@session.status = Constants::SESSION_STATUS_CLOSED
			if @session.save
				redirect_to chat_active_index_path, notice: 'Chat thread successfully closed.'
			else
				redirect_to chat_active_index_path, notice: 'An error occured, please try again.'
			end
		else
			redirect_to chat_active_index_path, notice: 'Not authorised!'
		end
	end
end
