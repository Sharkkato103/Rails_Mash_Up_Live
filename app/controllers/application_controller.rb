class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def current_course
  	@course ||= Course.find(session[:course_id])
  end
  
  def current_question
  	@question ||= Question.find(session[:question_id])
  end
end
