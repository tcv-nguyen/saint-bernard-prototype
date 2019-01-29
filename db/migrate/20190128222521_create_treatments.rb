class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
      t.integer :patient_id
      t.text    :description, :necessity

      t.timestamps
    end
  end
end
