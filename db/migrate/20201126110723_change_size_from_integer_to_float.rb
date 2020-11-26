class ChangeSizeFromIntegerToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :species, :size, :float
  end
end
