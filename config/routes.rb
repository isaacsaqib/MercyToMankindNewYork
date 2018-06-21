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
get "/listings-tees" => "listings#tees"
get "/listings-long_sleeves" => "listings#long_sleeves"
get "/listings-short_sleeves" => "listings#short_sleeves"
get "/listings-jackets" => "listings#jackets"
get "/listings-hoodies" => "listings#hoodies"
get "/listings-bottoms" => "listings#bottoms"
get "/listings-denim" => "listings#denim"
get "/listings-trousers" => "listings#trousers"
get "/listings-shorts" => "listings#shorts"
get "/listings-head" => "listings#head"
get "/listings-accessories" => "listings#accessories"
get "/listings-sale" => "listings#sale"
get "/listings-hidden" => "listings#hidden"
get "/pre_spring_2017" => "listings#pre_spring_2017"
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
get "/press" => "welcome#press"

post "make_default" => "pictures#make_default"
get "/complete" => "welcome#complete"
get "/customercare" => "customers#index"


end
