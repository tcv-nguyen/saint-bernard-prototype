class AddIndexToNameFromFacilities < ActiveRecord::Migration[5.2]
  def change
    add_index :facilities, :name, unique: true
  end
end
