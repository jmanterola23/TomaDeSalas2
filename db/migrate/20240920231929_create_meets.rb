class CreateMeets < ActiveRecord::Migration[7.0]
  def change
    create_table :meets do |t|
      t.string :description
      t.boolean :reserved, default: false
      t.time :hour
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
