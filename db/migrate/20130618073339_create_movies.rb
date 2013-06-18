class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :movie_title
      t.integer :release_year
      t.string :director

      t.timestamps
    end
  end
end
