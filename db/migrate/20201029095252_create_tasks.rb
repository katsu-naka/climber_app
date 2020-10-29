class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :text
      t.date :date, null: false
      t.integer :done, null: false
      t.references :user,null: false, foreign_key: true
      t.timestamps
    end
  end
end
