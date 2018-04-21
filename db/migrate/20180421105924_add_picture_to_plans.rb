class AddPictureToPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :front_picture, :string
  end
end
