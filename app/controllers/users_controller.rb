class UsersController < BaseController
	def index  
  		if params[:term]
    		@users = User.select(:username, :id).where("username LIKE ?", "#{params[:term]}%")
  		else
    		@users = User.select(:username, :id)
  		end
  		respond_to do |format|  
  			format.html #index.html.erb
    		format.json { render :json => @users.to_json }
    	end
	end
end
