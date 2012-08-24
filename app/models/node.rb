class Node < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :line_items, :dependent => :destroy
  
  def delete_log_from_node(node)
    node.line_items.each do |item|
      if item.log_id != nil
        log = Log.find(item.log_id)
        log.destroy
      end
    end
  end
  
end
