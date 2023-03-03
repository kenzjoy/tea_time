class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription

  validates :customer_id, uniqueness: { scope: :subscription_id }

  enum status: [ :active, :cancelled ]
  enum frequency: { '1_month' => 0, '2_month' => 1, '3_month' => 2 }
end