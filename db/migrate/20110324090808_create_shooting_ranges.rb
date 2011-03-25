class CreateShootingRanges < ActiveRecord::Migration
  def self.up
    create_table :shooting_ranges do |t|
      t.string :name
      t.string :description
      t.string :address
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end

  def self.down
    drop_table :shooting_ranges
  end
end
