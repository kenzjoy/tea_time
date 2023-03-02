require 'rails_helper'

RSpec.describe 'POST /tea-subscriptions' do
  describe 'when tea_id & subscription_id are valid' do
    it 'adds a tea subscription to customers list of subscriptions' do 
      kenz = Customer.create!(
        id: 1,
        first_name: 'Kenz',
        last_name: 'Leng',
        email: 'kenz@ilovetea.com',
        address: '318 E 3rd Ave Durango, CO 81301'
      )
      subscription_1 = Subscription.create!(
        id: 1,
        customer_id: kenz.id,
        title: 'Orange Clove Tea',
        price: 7.99,
        status: 0,
        frequency: 0
      )
      tea_1 = Tea.create!(
        id: 5,
        title: 'Orange Clove Tea',
        description: 'Support your overall health with Yogi Orange Clove tea, a limited-edition blend sold during the holidays. Bright Orange Peel and aromatic Clove combine with Astragalus, a herb traditionally used for its ability to help support immune function. Traditional Ayurvedic warming spices including Cinnamon, Cardamom, Ginger, and Black Pepper add delicious spiced notes. The result is a perfectly spiced and citrusy herbal tea blend that is sure to make your holidays merry and bright.',
        temperature: 'boiling water',
        brew_time: '7 minutes'
      )
      
      headers = { "Content-Type": "application/json", Accept: "application/json" }
      body = ( {
        "tea_id": 5,
        "subscription_id": 1
      } )

      expect(kenz.subscriptions.count).to eq(0)

      post '/api/v1/tea-subscriptions', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end
end