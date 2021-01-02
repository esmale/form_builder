class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :form_id,      null: false
      t.string :question_type, null: false
      t.string :label,         null: false

      t.timestamps
    end
  end
end
