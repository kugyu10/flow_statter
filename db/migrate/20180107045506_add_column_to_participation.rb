class AddColumnToParticipation < ActiveRecord::Migration[5.0]
  def change
    add_column :participations, :status, :integer
  end
end
