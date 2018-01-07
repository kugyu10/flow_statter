class AddTiltleToPlan < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :title, :string
  end
end
