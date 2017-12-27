class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :twitter_id
      t.string :nickname
      t.string :provider
      t.string :uid
      t.string :image_url

      t.timestamps
    end
  end
end
