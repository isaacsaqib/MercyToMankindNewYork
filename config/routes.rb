Rails.application.routes.draw do

  get 'errors/not_found'

  get 'errors/internal_server_error'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :listings do
    member do
      post :add_to_cart
      delete :remove_from_cart
    end
  end
resources :charges
resources :checkout
resources :shipping
resources :orders
resource :cart
resources :admins
resources :pictures
resources :users
resources :collections
resources :coupons


match "/404", :to => "errors#not_found", :via => :all
match "/500", :to => "errors#internal_server_error", :via => :all
get "/listings-new" => "listings#new"
get "/listings-tops" => "listings#tops"
get "/listings-jackets" => "listings#jackets"
get "/listings-bottoms" => "listings#bottoms"
get "/listings-head" => "listings#head"
get "/listings-accessories" => "listings#accessories"
get "/listings-sale" => "listings#sale"
get "/fall_winter_2016" => "listings#fall_winter_2016"
get "/spring_summer_2016" => "listings#spring_summer_2016"
get "/fall_winter_2015" => "listings#fall_winter_2015"
get "/judgement_day_capsule" => "listings#judgement_day_capsule"

get  "/admin"  => "session#new"
post "/session"      => "session#create"
  #logout route
get  "/logout"       => "session#destroy"

root "welcome#index"
# root "welcome#index"


get "/index" => "welcome#index"
get "/springsummersixteen" => "welcome#springsummersixteen"
get "/media" => "welcome#media"
get "/brand" => "welcome#brand"

post "make_default" => "pictures#make_default"
get "/complete" => "welcome#complete"
get "/customercare" => "customers#index"



  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
