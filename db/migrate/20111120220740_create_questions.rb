class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.integer :excellence, :default => 0
      t.integer :votes_count, :default => 0
      t.integer :answers_count, :default => 0
      t.integer :views_count, :default => 0
      t.integer :best_answer_id
      t.integer :user_id
      t.timestamps
    end
  end
end
