class ApplicationController < ActionController::Base
  protect_from_forgery
  
  self.allow_forgery_protection = false
  
  private
  
  def current_course
  	@course ||= Course.find(session[:course_id])
  end
  
  def current_question
  	@question ||= Question.find(session[:question_id])
  end
end
