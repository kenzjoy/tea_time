class Api::V1::CustomerSubscriptionsController < ApplicationController
  
  def create
    customer_subscription = CustomerSubscription.new(customer_id: params[:customer_id], subscription_id: params[:subscription_id])
    if customer_subscription.save
      render json: { 'success': 'Subscription Added' }, status: 200
    else
      render json: { 'error': 'Subscription Not Added' }, status: 400
    end
  end

  def update
    # cust_sub_id = params[:id]
    # if cust_sub_id.present?
    #   customer_subscription = CustomerSubscription.find_by(id: cust_sub_id)
    #   if !customer_subscription.nil? && customer_subscription.status == "active"
    # end
    customer_subscription = CustomerSubscription.find_by(customer_id: params[:customer_id], subscription_id: params[:subscription_id])
    if customer_subscription.present?
      customer_subscription.update(cust_subscription_params) 
      # require 'pry'; binding.pry
      render json: CustomerSubscriptionsSerializer.new(customer_subscription)
    end
  end

  private

  def cust_subscription_params
    params.permit(:customer_id, :subscription_id, :status, :frequency)
  end
end