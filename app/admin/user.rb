ActiveAdmin.register User do
  
  permit_params :id, :first_name, :last_name, :email, user_roles_attributes: [:id, [:role_id], :_destroy], user_images_attributes: [:id, :image, :_destroy]
  
  index do
    column "Images" do |user|
      ul do 
        user.user_images.map do |u_image|
          li do
            image_tag(u_image.image.url(:thumbnail))
          end
        end
      end
    end
    column :first_name
    column :last_name
    column :email
    column "Roles" do |user|
      user.roles.pluck :name
    end
    
    actions
  end
  
  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      user.user_images.map do |u_image|
        row u_image.image_content_type do
          image_tag(u_image.image(:normal))
        end
      end
    end
  end  
  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs "Roles" do
      f.has_many :user_roles do |s|
        s.input :role_id, as: :select, collection: Role.active, input_html:  { :multiple => true }
      end
    end
    f.inputs "Images" do
      f.has_many :user_images do |s|
        s.input :image, as: :file
      end
    end
    f.actions        
  end
  
  filter :roles, as: :select, collection: Role.active

end
