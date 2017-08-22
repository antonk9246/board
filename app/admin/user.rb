ActiveAdmin.register User do
  permit_params :admin, :email, :password, :password_confirmation
  scope :all

  filter :admin
  filter :created_at

  index :as => :table do
    column :id
    column :email
    column :admin
    column :created_at
    actions
  end

  form do |f|
    inputs 'User' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin
    end
    f.semantic_errors
    f.actions
  end

  controller do
 
    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end
end
