Rails.application.routes.draw do
  
  resources :datos, as: :facts, controller: :facts
  root to: "home#index"

end
