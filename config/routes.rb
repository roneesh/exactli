Exactli::Application.routes.draw do
  post "annotation/create"

  delete "/delete_annotation/:number", {controller: "Annotation", action: "destroy"}

  resources :document_versions

  get "/document_versions/:id/annotate", controller: "DocumentVersions", action: "annotate", as: "annotation"

  get "/document_versions/:id/export", controller: "DocumentVersions", action: "export", as: "export"

  get "/guest_view/:access_link", controller: "DocumentVersions", action: "access_link", as: "access_link"
  
  resources :documents

  authenticated :user do
    root :to => 'home#index'
  end
  
  root :to => "home#splash_page"
  devise_for :users
  resources :users

  get "/users/:id/archive_delete", controller: "Users", action: "archive_delete", as: "archive_delete"


end