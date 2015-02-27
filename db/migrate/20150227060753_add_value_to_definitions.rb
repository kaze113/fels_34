class AddValueToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :value, :boolean, default: false
  end
end
