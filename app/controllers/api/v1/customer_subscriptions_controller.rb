class Api::V1::CustomerSubscriptionsController < ApplicationController
  
  def create
     customer_subscription = CustomerSubscription.new(customer_id: params[:customer_id], subscription_id: params[:subscription_id])
     if customer_subscription.save
      render json: { 'success': 'Subscription Added'}
     else
      render json: { 'error': 'Subscription Not Added'}
     end
  end
end