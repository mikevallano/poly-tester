class AddColorsToFlames < ActiveRecord::Migration
  def change
    add_column :flames, :colors, :text
  end
end
