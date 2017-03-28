Rails.application.routes.draw do
  root 'home#' 'start'
  get 'home/start'
  get 'home/clients'
  get 'home/community'
  get 'home/contact'
  get 'home/jobs'
  get 'home/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
