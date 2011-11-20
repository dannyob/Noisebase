class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.integer :excellence
      t.integer :votes_count
      t.integer :answers_count
      t.integer :views_count
      t.integer :answer_id

      t.timestamps
    end
  end
end
