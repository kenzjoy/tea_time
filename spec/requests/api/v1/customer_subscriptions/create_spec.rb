require 'rails_helper'

RSpec.describe 'POST /customer-subscriptions' do
  describe 'when customer_id & subscription_id are valid' do
    it 'adds a tea subscription to customers list of subscriptions' do 
      kenz = Customer.create!(
        id: 1,
        first_name: 'Kenz',
        last_name: 'Leng',
        email: 'kenz@ilovetea.com',
        address: '318 E 3rd Ave Durango, CO 81301'
      )
      tea_1 = Tea.create!(
        id: 5,
        title: 'Orange Clove Tea',
        description: 'Support your overall health with Yogi Orange Clove tea, a limited-edition blend sold during the holidays. Bright Orange Peel and aromatic Clove combine with Astragalus, a herb traditionally used for its ability to help support immune function. Traditional Ayurvedic warming spices including Cinnamon, Cardamom, Ginger, and Black Pepper add delicious spiced notes. The result is a perfectly spiced and citrusy herbal tea blend that is sure to make your holidays merry and bright.',
        temperature: 'boiling water',
        brew_time: '7 minutes',
        image: 'https://yogiproducts.com/wp-content/uploads/2019/10/YT-US-OrangeClove-CAR-C23-202446-3DFront-WithGlow-300DPI-PNG.png'
      )
      subscription_1 = Subscription.create!(
        id: 1,
        tea_id: 5,
        title: 'Orange Clove Tea',
        price: 7.99,
        status: 0,
        frequency: 0
      )
      
      headers = { "Content-Type": "application/json", Accept: "application/json" }
      body = ( {
        "customer_id": 1,
        "subscription_id": 1
      } )

      expect(kenz.customer_subscriptions.count).to eq(0)

      post '/api/v1/customer-subscriptions', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:success)
      expect(parsed[:success]).to eq('Subscription Added')

      expect(kenz.customer_subscriptions.count).to eq(1)
    end
  end

  describe 'when a customer_id is not valid' do
    it 'returns an error message' do
      tea_1 = Tea.create!(
        id: 5,
        title: 'Orange Clove Tea',
        description: 'Support your overall health with Yogi Orange Clove tea, a limited-edition blend sold during the holidays. Bright Orange Peel and aromatic Clove combine with Astragalus, a herb traditionally used for its ability to help support immune function. Traditional Ayurvedic warming spices including Cinnamon, Cardamom, Ginger, and Black Pepper add delicious spiced notes. The result is a perfectly spiced and citrusy herbal tea blend that is sure to make your holidays merry and bright.',
        temperature: 'boiling water',
        brew_time: '7 minutes',
        image: 'https://yogiproducts.com/wp-content/uploads/2019/10/YT-US-OrangeClove-CAR-C23-202446-3DFront-WithGlow-300DPI-PNG.png'
      )
      subscription_1 = Subscription.create!(
        id: 1,
        tea_id: 5,
        title: 'Orange Clove Tea',
        price: 7.99,
        status: 0,
        frequency: 0
      )

      headers = { "Content-Type": "application/json", Accept: "application/json" }
      body = ( {
        "customer_id": nil,
        "subscription_id": 1
      } )

      post '/api/v1/customer-subscriptions', headers: headers, params: JSON.generate(body)
      
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:error)
      expect(parsed[:error]).to eq('Subscription Not Added')
    end
  end

  describe 'when the subscription already exists in that customers subscriptions' do
    it 'returns an error and does not add that subscription to customer subscriptions' do
      kenz = Customer.create!(
        id: 1,
        first_name: 'Kenz',
        last_name: 'Leng',
        email: 'kenz@ilovetea.com',
        address: '318 E 3rd Ave Durango, CO 81301'
      )
      tea_1 = Tea.create!(
        id: 5,
        title: 'Orange Clove Tea',
        description: 'Support your overall health with Yogi Orange Clove tea, a limited-edition blend sold during the holidays. Bright Orange Peel and aromatic Clove combine with Astragalus, a herb traditionally used for its ability to help support immune function. Traditional Ayurvedic warming spices including Cinnamon, Cardamom, Ginger, and Black Pepper add delicious spiced notes. The result is a perfectly spiced and citrusy herbal tea blend that is sure to make your holidays merry and bright.',
        temperature: 'boiling water',
        brew_time: '7 minutes',
        image: 'https://yogiproducts.com/wp-content/uploads/2019/10/YT-US-OrangeClove-CAR-C23-202446-3DFront-WithGlow-300DPI-PNG.png'
      )
      subscription_1 = Subscription.create!(
        id: 1,
        tea_id: 5,
        title: 'Orange Clove Tea',
        price: 7.99,
        status: 0,
        frequency: 0
      )

      headers = { "Content-Type": "application/json", Accept: "application/json" }
      body = ( {
        "customer_id": 1,
        "subscription_id": 1
      } )

      expect(kenz.customer_subscriptions.count).to eq(0)

      post '/api/v1/customer-subscriptions', headers: headers, params: JSON.generate(body)

      expect(kenz.customer_subscriptions.count).to eq(1)

      post '/api/v1/customer-subscriptions', headers: headers, params: JSON.generate(body)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
        
      parsed = JSON.parse(response.body, symbolize_names: true)
              
      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:error)
      expect(parsed[:error]).to eq('Subscription Not Added')

      expect(kenz.customer_subscriptions.count).to eq(1)
    end
  end

  describe 'when the subscription_id is not valid' do
    it 'returns an error message' do
      kenz = Customer.create!(
        id: 1,
        first_name: 'Kenz',
        last_name: 'Leng',
        email: 'kenz@ilovetea.com',
        address: '318 E 3rd Ave Durango, CO 81301'
      )

      headers = { "Content-Type": "application/json", Accept: "application/json" }
      body = ( {
        "customer_id": 1,
        "subscription_id": nil
      } )

      post '/api/v1/customer-subscriptions', headers: headers, params: JSON.generate(body)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
        
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:error)
      expect(parsed[:error]).to eq('Subscription Not Added')

      expect(kenz.customer_subscriptions.count).to eq(0)
    end
  end
end