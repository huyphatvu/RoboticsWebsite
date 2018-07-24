Rails.application.routes.draw do
  namespace :admin do
    resources :swan_lakes
  end

  namespace :admin do
    resources :participants
  end

  devise_for :admins, skip: [:registrations, :passwords]



  # get 'entry', to: 'entries#index'

  comfy_route :cms_admin, path: "/admin"
  # Ensure that this route is defined last
  comfy_route :cms, path: "/"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
