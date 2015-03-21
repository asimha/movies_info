class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :language
      t.string :rating
      t.string :owner_id

      t.timestamps null: false
    end
  end
end
