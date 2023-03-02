class ChangeTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :tea_subscriptions, :customer_subscriptions
    rename_column :subscriptions, :customer_id, :tea_id
  end
end
