class FinalChange < ActiveRecord::Migration[5.2]
  def change
    remove_column :customer_subscriptions, :customers_id
  end
end
