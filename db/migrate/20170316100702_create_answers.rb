class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|

      t.string :description, :null => false
      t.integer :user_id, :null => false
      t.integer :question_id, :null => false
      t.boolean :chosen_answer

      t.timestamps
    end
  end
end
