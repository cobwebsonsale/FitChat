class BoardController < ApplicationController
	before_action :authenticate_user!, :redirect_members
	def index
		@queries = Session.where("user_id_to = ?", Constants::BROADCAST_USER).order(:created_at)
	end

	private

	def redirect_members
		if current_user.is_member
			flash[:alert] = "Oops! The page you're looking for does not exist"
        	redirect_to root_url
        end
    end	
end
