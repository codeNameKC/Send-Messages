Rails.application.routes.draw do
  resources :send_messages
  root 'home_page#index', as: 'home'
  
  resources :send_emails

end

