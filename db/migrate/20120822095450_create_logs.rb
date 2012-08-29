class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :title
      t.string :filepath
      t.string :file_size
      t.integer :operate_type
      t.string :reserve_dates
      t.time :cron_time

      t.timestamps
    end
  end
end
