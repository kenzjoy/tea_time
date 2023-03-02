class AddCustomersToCustomerSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :customer_subscriptions, :customers, foreign_key: true
    add_foreign_key :subscriptions, :teas
  end
end
