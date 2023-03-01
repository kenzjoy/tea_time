class AddCustomersToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscriptions, :customers, foreign_key: true
  end
end
