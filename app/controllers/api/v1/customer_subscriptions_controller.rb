class Api::V1::CustomerSubscriptionsController < ApplicationController
  
  def create
    customer_subscription = CustomerSubscription.new(customer_id: params[:customer_id], subscription_id: params[:subscription_id])
    if customer_subscription.save
      render json: { 'success': 'Subscription Added' }, status: 200
    else
      render json: { 'error': 'Subscription Not Added' }, status: 200
    end
  end

  def update
    if CustomerSubscription.exists?(params[:id])
      customer_subscription = CustomerSubscription.find(params[:id])
      if customer_subscription.update(cust_sub_params)
        customer_subscription.save
        render json: CustomerSubscriptionsSerializer.new(customer_subscription)
      end
    else
      render json: { 'error': 'Subscription Not Found' }, status: 404
    end
  end

  private

  def cust_sub_params
    params.require(:customer_subscription).permit(:customer_id, :subscription_id, :title, :price, :status, :frequency)
  end
end