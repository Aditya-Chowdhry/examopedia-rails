ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation,:role
  #controller.authorize_resource
  
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :role
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.collection_select(:role, AdminUser::ROLES, :to_s, lambda{|i| i.to_s.humanize})
    end
    f.actions
  end
  controller do
  before_filter :verify_admin
  private
  ##This will verify that access to admin users is only granted to ADmins  
  def verify_admin
    redirect_to  admin_dashboard_path,:flash => { :error => "Only admin access" } unless current_admin_user.role=='admin'
  end

  end
end
