class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :node_id
      t.integer :log_id

      t.timestamps
    end
  end
end
