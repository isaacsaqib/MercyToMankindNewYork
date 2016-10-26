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
    
    'Product_Details' => session[:product_details],
    'First_Name' => session[:firstname], 
    'Last_Name' => session[:lastname],
    'Address' => session[:address],
    'City_or_Province' => session[:city], 
    'State' => session[:state],
    'Zipcode' => session[:zip],
    'Country' => session[:country],
    'Email' => session[:email],
    'Code_Used' => session[:code]
  }
    # :source => { :address_city => session[:city] }
  )

  


  redirect_to "/orders/complete"

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end




end
