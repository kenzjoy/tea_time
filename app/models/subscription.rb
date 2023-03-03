class Subscription < ApplicationRecord
  belongs_to :tea
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions

  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :tea_id
  # validates_presence_of :status
  # validates_presence_of :frequency

  enum status: [ :active, :cancelled ]
  enum frequency: { '1_month' => 0, '2_month' => 1, '3_month' => 2 }
end