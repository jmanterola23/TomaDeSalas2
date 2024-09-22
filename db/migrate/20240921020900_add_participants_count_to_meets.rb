class AddParticipantsCountToMeets < ActiveRecord::Migration[7.0]
  def change
    add_column :meets, :participants_count, :integer
  end
end
