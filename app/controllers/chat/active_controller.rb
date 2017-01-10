class Chat::ActiveController < ApplicationController
	def index
		if current_user.is_member
			@sessions = Session.where("status = ? and user_from_id = ?", Constants::SESSION_STATUS_OPEN, current_user.id).order(:updated_at)
		elsif current_user.is_trainer
			@sessions = Session.where("status = ? and user_to_id = ?", Constants::SESSION_STATUS_OPEN, current_user.id).order(:updated_at)
		end
	end
end
