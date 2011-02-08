RailsMashUpLive::Application.routes.draw do
  resources :responses

  resources :questions

  resources :courses
	
	match "/questions/by_course_id/:course_id" => "questions#by_course_id"
	match "/responses/by_question_id/:question_id" => "responses#by_question_id"
	
	
	root :to => "Courses#index"
	
end
