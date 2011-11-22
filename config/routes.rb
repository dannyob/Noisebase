Communism::Application.routes.draw do
  match '/auth/:provider/callback', :to => 'sessions#create'
  resources :questions 
  root :to => 'questions#index'
  
end
