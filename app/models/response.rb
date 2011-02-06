class Response < ActiveRecord::Base
	validates_presence_of :qid, :body
	
	belongs_to :questions
end
