class AddDescriptionToMeets < ActiveRecord::Migration[7.0]
  def change
    add_column :meets, :description, :string
  end
end
