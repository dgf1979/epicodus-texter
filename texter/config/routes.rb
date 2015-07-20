Rails.application.routes.draw do
  root :to => 'messages#index'
  resources :messages, :only => [:index, :new, :create, :show]

  resources :contacts
  post 'reply', :to => 'replies#index'
end
