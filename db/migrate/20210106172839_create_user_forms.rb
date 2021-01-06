class CreateUserForms < ActiveRecord::Migration[6.1]
  def change
    create_table :user_forms do |t|
      t.integer :user_id
      t.integer :form_id

      t.timestamps
    end
  end
end
