class Message < ApplicationRecord
	belongs_to :session

	# ensure that a session_id is present
  	validates :session_id, presence: true

  	validates :author, presence: true
  	validates :text, presence: true
end
