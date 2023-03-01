class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :tea_subscriptions
  has_many :teas, through: :tea_subscriptions

  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :status
  validates_presence_of :frequency
  validates_presence_of :customer_id

  enum status: { active: 0, cancelled: 1 }
  enum frequency: { '1_month' => 0, '2_month' => 1, '3_month' => 2 }
end