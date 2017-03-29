Rails.application.routes.draw do
  root 'home#index'
  get 'home/clients'
  get 'home/community'
  get 'home/contact'
  get 'home/jobs'
  get 'home/about'
  get 'home/why_neubloc'
  get 'home/our_history'
  get 'home/management'
  get 'home/equity_option'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
