Rails.application.routes.draw do
  resources :verdicts
  resources :matches
  resources :rankings
  
  root 'matches#new'
end
