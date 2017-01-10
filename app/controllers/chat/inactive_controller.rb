class Chat::InactiveController < BaseController
	def index
		if current_user.is_member
			@sessions = Session.where("status = ? and user_from_id = ?", Constants::SESSION_STATUS_CLOSED, current_user.id).order(created_at: :desc)
		elsif current_user.is_trainer
			@sessions = Session.where("status = ? and user_to_id = ?", Constants::SESSION_STATUS_CLOSED, current_user.id).order(created_at: :desc)
		end
	end
end
