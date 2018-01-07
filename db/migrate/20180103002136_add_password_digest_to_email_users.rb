class AddPasswordDigestToEmailUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :email_users, :password_digest, :string
  end
end
