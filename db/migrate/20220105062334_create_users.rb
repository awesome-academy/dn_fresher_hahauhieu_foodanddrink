class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.integer :role, default: 0
      t.string :address
      t.string :phone
      t.string :password_digest

      t.timestamps
    end
  end
end
