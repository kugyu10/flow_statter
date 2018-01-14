class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.references :plan, foreign_key: true
      t.references :user, foreign_key: true
      t.string :participater_name
      t.integer :number_of_unit

      t.timestamps
    end
  end
end
