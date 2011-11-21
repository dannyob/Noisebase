class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :login
      t.string  :email
      t.string  :name
      t.string  :location
      t.integer :views_count, :default => 0
      t.integer :excellence, :default => 0
      t.string  :avatar
      t.text    :bio
      t.boolean :github_active, :default => false
      t.string  :github_uid
      t.string  :github_token
      t.string  :github_name
      t.string  :perishable_token
      t.string  :last_login_time
      t.string  :last_login_ip
      t.string  :perishable_token 
      t.timestamps
    end
  end
end
