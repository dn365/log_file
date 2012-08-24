class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :title
      t.string :filepath
      t.integer :file_size
      t.string :operate_type
      t.integer :reserve_dates
      t.time :cron_time

      t.timestamps
    end
  end
end
