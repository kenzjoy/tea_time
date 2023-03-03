class Api::V1::CustomerSubscriptionsController < ApplicationController
  
  def create
    customer_subscription = CustomerSubscription.new(customer_id: params[:customer_id], subscription_id: params[:subscription_id])
    if customer_subscription.save
      # require 'pry'; binding.pry
      render json: { 'success': 'Subscription Added' }, status: 200
    else
      render json: { 'error': 'Subscription Not Added' }, status: 200
    end
  end

  def update
    
  end
end