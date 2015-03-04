class AddWordIdsToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :word_ids, :string, default: ""
  end
end
