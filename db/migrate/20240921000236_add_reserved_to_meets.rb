class AddReservedToMeets < ActiveRecord::Migration[7.0]
  def change
    add_column :meets, :reserved, :boolean
  end
end
