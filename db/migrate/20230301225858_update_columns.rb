class UpdateColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :tea_subscriptions, :subscriptions_id, :subscription_id
    rename_column :tea_subscriptions, :teas_id, :tea_id
  end
end
