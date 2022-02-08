class AddPersonIdToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :person_id, :integer
  end
end
