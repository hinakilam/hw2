class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.text :title
      t.integer :year_released
      t.text :rating
      
      t.timestamps
    end
  end
end
