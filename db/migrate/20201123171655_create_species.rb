class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :name
      t.string :latin_name
      t.text :description
      t.string :threat_level
      t.integer :size
      t.string :color

      t.timestamps
    end
  end
end
