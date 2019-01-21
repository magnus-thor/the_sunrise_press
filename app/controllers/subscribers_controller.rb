class SubscribersController < ApplicationController
    before_action :authenticate_user!

    def new
        
    end

    def create
        user = User.find_by_id(current_user.id)
        customer = Stripe::Customer.create(
            email: user.email,
            source: get_token(params),
            description: user.name
        )
    
        charge = Stripe::Charge.create(
            customer: customer.id,
            amount: 10000,
            currency: 'SEK',
            description: 'Monthly fee for The Sunrise Press'
        )
    
        if charge[:paid]
            redirect_to root_path, notice: 'Thank you for subscribing to The Sunrise Press!'
            user.update(role: 1)
        else
            redirect_to root_path, notice: 'Charge declined'
        end
    
    end
    
    
    private
    
    def get_token(params)
        Rails.env.test? ? generate_test_token : params['stripeToken']
    end
    
    def generate_test_token
        StripeMock.create_test_helper.generate_card_token
    end
end
