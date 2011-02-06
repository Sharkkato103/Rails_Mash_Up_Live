RailsMashUpLive::Application.routes.draw do
  resources :responses

  resources :questions

  resources :courses

	root :to => "Courses#index"
	
end
