class Api::V1::CustomersController < ApplicationController
  def show
    id = params[:id]
    if id.present?
      customer = Customer.find_by(id: id)
      if customer.nil?
        render json: { error: 'No Customer Found' }, status: 404
      else
        render json: CustomersSerializer.new(customer)
      end
    else
      render json: { error: 'Provide A Customer Parameter' }, status: 404
    end
  end
end
