class RemoveForeginKeys < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :customer_subscriptions, :teas
    remove_foreign_key :subscriptions, :customers
  end
end
