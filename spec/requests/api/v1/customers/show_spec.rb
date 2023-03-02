require 'rails_helper'

RSpec.describe 'GET /customer' do
  describe 'when the records exist' do
    it 'returns a specified user and their favorite trails in json' do
      kenz = Customer.create!(
        id: 1,
        first_name: 'Kenz',
        last_name: 'Leng',
        email: 'kenz@ilovetea.com',
        address: '318 E 3rd Ave Durango, CO 81301'
      )

      get '/api/v1/customer?id=1'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to be_a(Hash)

      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data][:id]).to be_a(String)
      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data][:type]).to be_a(String)
      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:attributes]).to be_a(Hash)
      expect(parsed[:data][:attributes]).to have_key(:first_name)
      expect(parsed[:data][:attributes][:first_name]).to be_a(String)
      expect(parsed[:data][:attributes]).to have_key(:last_name)
      expect(parsed[:data][:attributes][:last_name]).to be_a(String)
      expect(parsed[:data][:attributes]).to have_key(:email)
      expect(parsed[:data][:attributes][:email]).to be_a(String)
      expect(parsed[:data][:attributes]).to have_key(:address)
      expect(parsed[:data][:attributes][:address]).to be_a(String)
      expect(parsed[:data][:attributes]).to have_key(:subscriptions)
      expect(parsed[:data][:attributes][:subscriptions]).to be_an(Array)
    end
  end

  describe 'when there are no records' do
    it 'returns an error' do
      get '/api/v1/customer?id=1001'

      expect(response).to_not be_successful
      expect(response).to have_http_status(404)
      
      parsed = JSON.parse(response.body, symbolize_names: true)
      
      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:error)
      expect(parsed[:error]).to eq('No Customer Found')
    end
  end
end