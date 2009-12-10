class RemoveNameFromSeparateExams < ActiveRecord::Migration
  def self.up
      remove_column :separate_exams, :name
  end

  def self.down
  end
end
