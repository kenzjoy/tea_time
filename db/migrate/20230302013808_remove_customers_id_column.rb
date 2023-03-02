class RemoveCustomersIdColumn < ActiveRecord::Migration[5.2]
  def change
    remove_index :customer_subscriptions, :customers_id
  end
end
