class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :excellence
      t.integer :votes_count
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end
end
