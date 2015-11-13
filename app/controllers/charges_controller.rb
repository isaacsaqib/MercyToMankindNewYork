class ChargesController < ApplicationController
	def new
		
end

def create
  # Amount in cents
  @amount = (params[:final_amount].to_f*100).to_i

  customer = Stripe::Customer.create(
    :email => session[:email],
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Payment For Item',
    :currency    => 'usd',
    :metadata => {
    
    'product_name' => session[:product_names],
    'first_name' => session[:firstname], 
    'last_name' => session[:lastname],
    'address' => session[:address],
    'city' => session[:city], 
    'state' => session[:state],
    'zipcode' => session[:zip],
    'country' => session[:country],
    'email' => session[:email]
  }
    # :source => { :address_city => session[:city] }
  )

  


  redirect_to "/orders/complete"

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end




end
