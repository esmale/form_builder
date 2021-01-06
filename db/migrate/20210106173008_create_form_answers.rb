class CreateFormAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :form_answers do |t|
      t.integer :user_form_id
      t.integer :question_id
      t.integer :answer_id
      t.string :answer

      t.timestamps
    end
  end
end
