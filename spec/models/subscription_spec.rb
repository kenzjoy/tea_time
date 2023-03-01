require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should belong_to :customer }
    it { should have_many :tea_subscriptions }
    it { should have_many(:teas).through(:tea_subscriptions) }
  end

  describe 'validations' do
    it { should validate presence_of :title }
    it { should validate presence_of :price }
    it { should validate presence_of :status }
    it { should validate presence_of :frequency }
    it { should validate presence_of :customer_id }
  end
end