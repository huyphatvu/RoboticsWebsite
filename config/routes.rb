Rails.application.routes.draw do
  namespace :admin do
    resources :comfy_references
    resources :source_references
  end

  comfy_route :cms_admin, path: "/admin"
  # Ensure that this route is defined last
  comfy_route :cms, path: "/"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
