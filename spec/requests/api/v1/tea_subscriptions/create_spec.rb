require 'rails_helper'

RSpec.describe 'POST /tea-subscriptions' do
  describe 'when tea_id & subscription_id are valid' do
    it 'adds a tea subscription to customers list of subscriptions' do 
      customer = FactoryBot.create(:customer)

      subscription_1 = Subscription.create!(
        customer_id: customer.id,
        title: 'Orange Clove Tea',
        price: 7.99,
        status: 0,
        frequency: 0
      )
      
      headers = { "Content-Type": "application/json", Accept: "application/json" }
      body = ( {
        "tea_id": 5,
        "subscription_id": 1
      } )

      expect(customer.subscriptions.count).to eq(0)

      post '/api/v1/tea-subscriptions', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end
end