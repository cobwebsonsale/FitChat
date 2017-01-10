class Session < ApplicationRecord
	has_many :messages, dependent: :destroy
	belongs_to :user_to, class_name: 'User'
	belongs_to :user_from, class_name: 'User'
	
	def isOpen
		return self.status == Constants::SESSION_STATUS_OPEN
	end

	def getMessages
		return Message.where("session_id = ?", self.id).order(self.created_at)
	end
end
