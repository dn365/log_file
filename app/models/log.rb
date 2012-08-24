class Log < ActiveRecord::Base
  attr_accessible :cron_time, :file_size, :filepath, :operate_type, :reserve_dates, :title
  has_many :line_items
  
  OPERATE_TYPES = [["RM(Only delete)",0], ["TAR(Only tar)",1], ["TAR->RM(tar first then rm old file)",2]]
  
  validates_presence_of :title, :filepath, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :title, :on => :create, :message => "must be unique"
  
  
  def add_line_item_from_log(node,log)
    line_items.build(:node_id => node, :log_id => log)
  end
  
  def delete_line_item_from_log(log)
    line_item = line_items.find_by_log_id(log)
    line_item.destroy
  end
      
  
end
