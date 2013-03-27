Exactli::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#splash_page"
  devise_for :users
  resources :users
end