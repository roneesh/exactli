Exactli::Application.routes.draw do
  post "annotation/create"

  get "annotation/destroy"

  resources :document_versions

  get "/document_versions/:id/annotate", controller: "DocumentVersions", action: "annotate", as: "annotation"

  resources :documents


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#splash_page"
  devise_for :users
  resources :users

  get "/users/:id/archive_delete", controller: "Users", action: "archive_delete", as: "archive_delete"

end