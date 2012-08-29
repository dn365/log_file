class Log < ActiveRecord::Base
  attr_accessible :cron_time, :file_size, :filepath, :operate_type, :reserve_dates, :title, :recurse, :file_time
  has_many :line_items
  
  OPERATE_TYPES = [["RM",0], ["Archive",1], ["Cat null",2]]
  RECURSE_TYPES = [["path",0], ["path/*",1], ["path/*/*",2],["path/**/*",3]]
  FILETIME_TYPES = [["ctime",0],["mtime",1],["atime",2]]
  
  validates_presence_of :title, :filepath, :on => :create, :message => "can't be blank"
  validates :file_size, :format => {
    :with => /^$|(\d+b|k|m|g|t)/i,
    :message => "file size value error !"
  }
  validates :reserve_dates, :format => {
    :with => /(\d+h|d|w)/i,
    :message => "Input file age value error !"
  }
  
  def add_line_item_from_log(node,log)
    line_items.build(:node_id => node, :log_id => log)
  end
  
  def delete_line_item_from_log(log)
    line_item = line_items.find_by_log_id(log)
    line_item.destroy
  end
      
  
end
