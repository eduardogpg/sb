Rails.application.routes.draw do
  
  resources :facts
  root to: "home#index"

end
