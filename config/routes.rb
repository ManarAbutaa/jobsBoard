Rails.application.routes.draw do
  resources :resumes
  devise_for :users 

  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end 
  resources :jobs
  #get 'home/index'
  get 'home/about'
  #root 'home#index'
  root 'jobs#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end