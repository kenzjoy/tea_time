class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :teas, :image, :string
  end
end
