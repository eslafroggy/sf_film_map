class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :movies_title
      t.string :director
      t.string :genre
      t.string :address
      t.integer :release_year

      t.timestamps
    end
  end
end
