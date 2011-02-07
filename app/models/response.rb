class Response < ActiveRecord::Base
	validates_presence_of :question_id, :body
	
	belongs_to :questions
end
