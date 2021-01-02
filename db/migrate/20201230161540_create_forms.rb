class CreateForms < ActiveRecord::Migration[6.1]
  def change
    create_table :forms do |t|
      t.string :name, null: false
      t.boolean :published, default: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
