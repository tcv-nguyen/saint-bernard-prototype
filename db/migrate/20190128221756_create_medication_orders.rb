class CreateMedicationOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :medication_orders do |t|
      t.integer :patient_id, :order_frequency_id
      t.string  :name, :unit, :route
      t.decimal :dosage

      t.timestamps
    end
  end
end
