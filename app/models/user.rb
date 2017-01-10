class User < ApplicationRecord
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
           :rememberable, :validatable

    has_many :sessions
    def get_user_type
      	if self.user_type == Constants::USER_TYPE_MEMBER
      		  return "Member"
      	elsif self.user_type == Constants::USER_TYPE_TRAINER
      		  return "Trainer"
      	elsif self.user_type == Constants::USER_TYPE_ADMIN
      		  return "Admin"	
      	end
    end

    def is_member
        return self.user_type == Constants::USER_TYPE_MEMBER
    end

    def is_trainer
        return self.user_type == Constants::USER_TYPE_TRAINER
    end 

    def has_active_session
        session = Session.where("status = ? and user_from_id = ?", Constants::SESSION_STATUS_OPEN, self.id).order(:created_at).first
        return !session.nil?
    end
end
