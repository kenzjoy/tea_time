class AnotherChange < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :customer_subscriptions, :customers
  end
end
