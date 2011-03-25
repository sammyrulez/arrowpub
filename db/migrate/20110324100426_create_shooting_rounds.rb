class CreateShootingRounds < ActiveRecord::Migration
  def self.up
    create_table :shooting_rounds do |t|
      t.integer :session_id
      t.integer :arrows
      t.integer :targets
      t.integer :spots

      t.timestamps
    end
  end

  def self.down
    drop_table :shooting_rounds
  end
end
