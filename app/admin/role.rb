ActiveAdmin.register Role do
  permit_params :name, :active
  
  batch_action :destroy, false
  
  batch_action :hide_roles do |ids|
    Role.where(id: ids).update_all active: false
    redirect_to admin_roles_path
  end
end
