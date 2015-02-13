class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.string :word_def
      t.references :word, index: true

      t.timestamps null: false
    end
    add_foreign_key :definitions, :words
    add_index :definitions, [:word_id]
  end
end
