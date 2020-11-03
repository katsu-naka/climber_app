class CreateInquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiries do |t|
      t.string :name
      t.text :text

      t.timestamps
    end
  end
end
