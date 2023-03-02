class ChangeTeaColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :customer_subscriptions, :tea_id, :customer_id
  end
end
