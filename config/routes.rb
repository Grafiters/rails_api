Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/regis', to: "session/registers#create"
  post '/login', to: "session/logins#create"

  get '/currency', to: "currencies#index"

  get '/user', to: "users#show"
  
  get '/confirm/:pin', to: "confirm_emails#create", :as => "confirm_email"

  post '/email/change', to: "change_emails#create", :as => "change_email"
end
