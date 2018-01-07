class CreateEmailUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :email_users do |t|
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
