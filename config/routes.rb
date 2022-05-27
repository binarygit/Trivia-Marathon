Rails.application.routes.draw do
  resources :verdicts
  resources :matches
  
  root 'matches#new'
end
