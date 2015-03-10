class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :lesson_id
      t.integer :word_id
      t.integer :definition_id

      t.timestamps null: false
    end
  end
end
