class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :maximum => 25
      t.string :last_name, :maximum => 50
      t.string :email
      t.string :username, :minimum => 6
      t.string :password, :maximum => 100
      t.boolean :is_admin?, :default => true
      t.boolean :is_super_admin?, :default => false

      t.timestamps null: false
    end
  end
end
