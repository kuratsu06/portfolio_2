Rails.application.routes.draw do
  scope :portfolio_2 do
    root to: 'home#top'
    devise_for :users
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
