class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :content
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :words, :categories
    add_index  :words, [:category_id]
  end
end
