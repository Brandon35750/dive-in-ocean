class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.date :diving_date
      t.float :latitude
      t.float :longitude
      t.string :spot_name
      t.text :description
      t.integer :depth
      t.references :user, null: false, foreign_key: true
      t.references :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
