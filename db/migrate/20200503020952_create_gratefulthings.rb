class CreateGratefulthings < ActiveRecord::Migration[5.2]
  def change
    create_table :gratefulthings do |t|
      t.text :content
      t.references :entry, foreign_key: true

      t.timestamps
    end
  end
end
