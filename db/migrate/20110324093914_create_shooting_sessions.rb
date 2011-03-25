class CreateShootingSessions < ActiveRecord::Migration
  def self.up
    create_table :shooting_sessions do |t|
      t.date :performed_on
      t.integer :range_id
      t.integer :archer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :shooting_sessions
  end
end
