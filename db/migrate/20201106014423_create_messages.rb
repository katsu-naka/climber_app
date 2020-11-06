class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :message,null: false
      t.references :user,null: false,foreign_key: true
      t.references :task,null: false,foreign_key: true
      t.timestamps
    end
  end
end
