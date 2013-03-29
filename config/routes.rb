Exactli::Application.routes.draw do
  resources :document_versions

  get "/document_versions/:id/annotate", controller: "DocumentVersions", action: "annotate", as: "annotation"

  resources :documents


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#splash_page"
  devise_for :users
  resources :users
end