class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :fun_facts
      t.integer :movie_id

      t.timestamps
    end
  end
end
