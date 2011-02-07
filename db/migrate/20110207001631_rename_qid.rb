class RenameQid < ActiveRecord::Migration
  def self.up
  	rename_column :responses, :qid, :question_id
  end

  def self.down
  	rename_column :questions, :question_id, :qid
  end
end
