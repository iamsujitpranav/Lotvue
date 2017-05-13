ActiveAdmin.register Role do
  menu priority: 4
  
  permit_params :name, :active
  
  before_filter :skip_sidebar!, :only => :index
  
  batch_action :destroy, false
  
  batch_action :hide_roles do |ids|
    Role.where(id: ids).update_all active: false
    redirect_to admin_roles_path
  end
  
  batch_action :show_roles do |ids|
    Role.where(id: ids).update_all active: true
    redirect_to admin_roles_path
  end
end
