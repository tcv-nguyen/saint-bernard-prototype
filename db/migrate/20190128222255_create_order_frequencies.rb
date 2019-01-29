class CreateOrderFrequencies < ActiveRecord::Migration[5.2]
  def change
    create_table :order_frequencies do |t|
      t.string  :value, :unit

      t.timestamps
    end
  end
end
