class UpdateEnumValues < ActiveRecord::Migration[5.2]
  def change
    change_column :subscriptions, :status, :integer, :default => 0 
    change_column :subscriptions, :frequency, :integer, :default => 0 
  end
end
