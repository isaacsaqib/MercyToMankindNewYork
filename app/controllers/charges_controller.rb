class ChargesController < ApplicationController
	def new
		
end

def create
  # Amount in cents
  @amount = (params[:final_amount].to_f*100).to_i

  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'

  )

  


  redirect_to "/orders"

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

end
