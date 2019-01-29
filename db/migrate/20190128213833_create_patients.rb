class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.integer :facility_id
      t.string  :first_name, :middle_name, :last_name, :mr, :gender
      t.datetime  :dob

      t.timestamps
    end
  end
end
