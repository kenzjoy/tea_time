class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :tea_subscriptions
  has_many :teas, through: :tea_subscriptions

  

  enum status: { active: 0, cancelled: 1 }
  enum frequency: { '1_month' => 0, '2_month' => 1, '3_month' => 2 }
end