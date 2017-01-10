class BoardController < BaseController
	before_action :redirect_members
	def index
		@sessions = Session.where("user_to_id = ?", Constants::BROADCAST_USER).order(:created_at)
	end

	private

	def redirect_members
		if current_user.is_member
			flash[:alert] = "Oops! The page you're looking for does not exist"
        	redirect_to root_url
        end
    end	
end
