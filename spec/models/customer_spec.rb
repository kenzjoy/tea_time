require 'rails_helper'

RSpec.describe Customer, type: :class do
  describe 'relationships' do
    it { should have_many :subscriptions }
  end
end