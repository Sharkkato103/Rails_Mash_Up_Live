class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.integer :qid
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end
