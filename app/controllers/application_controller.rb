class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def current_course
  	Course.find(session[:course_id])
  end
  
  def current_question
  	Question.find(session[:qid])
  end
end
