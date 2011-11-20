class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.integer :views_count
      t.text :bio

      t.timestamps
    end
  end
end
