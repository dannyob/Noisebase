Communism::Application.routes.draw do
  match '/auth/:provider/callback', :to => 'sessions#create'
  resources :questions 
  resources :answers 
  root :to => 'questions#index'
  
end
