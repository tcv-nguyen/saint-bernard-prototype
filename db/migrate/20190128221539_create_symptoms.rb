class CreateSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :symptoms do |t|
      t.integer :admission_id
      t.text    :description

      t.timestamps
    end
  end
end
