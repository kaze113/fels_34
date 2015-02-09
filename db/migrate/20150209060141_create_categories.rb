class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.text :intro

      t.timestamps null: false
    end
    add_index :categories, :title
  end
end
