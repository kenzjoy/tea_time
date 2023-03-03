class AddColumnsToCustSubs < ActiveRecord::Migration[5.2]
  def change
    add_column :customer_subscriptions, :status, :integer, :default => 0
    add_column :customer_subscriptions, :frequency, :integer, :default => 0
  end
end
