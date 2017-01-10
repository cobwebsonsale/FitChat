class Chat::InactiveController < ApplicationController
	def index
		if current_user.is_member
			@sessions = Session.where("status = ? and user_from_id = ?", Constants::SESSION_STATUS_CLOSED, current_user.id).order(:created_at)
		elsif current_user.is_trainer
			@sessions = Session.where("status = ? and user_to_id = ?", Constants::SESSION_STATUS_CLOSED, current_user.id).order(:created_at)
		end
	end
end
