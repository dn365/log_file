class AddRecurseAndFileTimeToLog < ActiveRecord::Migration
  def change
    add_column :logs, :recurse, :integer
    add_column :logs, :file_time, :integer
  end
end
