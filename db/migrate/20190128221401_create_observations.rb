class CreateObservations < ActiveRecord::Migration[5.2]
  def change
    create_table :observations do |t|
      t.integer :admission_id
      t.text    :description
      t.datetime  :moment

      t.timestamps
    end
  end
end
