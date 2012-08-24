class LineItem < ActiveRecord::Base
  attr_accessible :log_id, :node_id
  belongs_to :node
  belongs_to :log
end
