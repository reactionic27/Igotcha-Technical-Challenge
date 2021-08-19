Rails.application.routes.draw do
  resources :users do
  end
  
  post "register" => "users#register"
  post "login" => "authentication#login"
end
