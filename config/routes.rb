Rails.application.routes.draw do
  root "pages#index"
  get 'pages/scrape_reddit'
end
