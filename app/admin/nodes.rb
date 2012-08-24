ActiveAdmin.register Node do
  
  index do
    column :name do |node|
      link_to node.name, [:admin, node]
    end
    column :description
    default_actions
  end
  
end
