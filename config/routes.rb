Rails.application.routes.draw do
  resources :send_messages
  root 'home_page#index', as: 'home'
  
  resources :send_emails
  get "send_emails/new"=>"send_emails#new"
end

