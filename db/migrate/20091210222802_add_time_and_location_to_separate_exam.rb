class AddTimeAndLocationToSeparateExam < ActiveRecord::Migration
  def self.up
      add_column :separate_exams, :location, :string
      add_column :separate_exams, :time, :string
  end

  def self.down
      add_column :separate_exams, :location
      add_column :separate_exams, :time
  end
end
