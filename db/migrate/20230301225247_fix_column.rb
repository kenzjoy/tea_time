class FixColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :subscriptions, :customers_id, :customer_id
  end
end
