class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :address
      t.string :activity
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps

      t.timestamps
      add_column :character, :latitude,  :float #you can change the name, see wiki
      add_column :character, :longitude, :float #you can change the name, see wiki
      add_column :character, :gmaps, :boolean #not mandatory, see wiki

    end
  end
end
