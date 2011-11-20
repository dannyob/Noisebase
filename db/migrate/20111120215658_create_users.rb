class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :login
      t.string  :email
      t.integer :views_count, :default => 0
      t.integer :excellence, :default => 0
      t.string  :avatar
      t.text    :bio 
      t.timestamps
    end
  end
end
