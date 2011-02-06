class Question < ActiveRecord::Base
	belongs_to :course
	
	validates_presence_of :title, :body, :course_id
	
	has_many :responses

end
