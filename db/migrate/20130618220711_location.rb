class Location < ActiveRecord::Migration
  def change
    change_table :locations do |t|
    t.text :fun_fact
    remove_column :locations, :movie_id
    remove_column :locations, :fun_facts
    end
  end


end
