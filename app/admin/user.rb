ActiveAdmin.register User do

    index :as => :table do
    column :id
    column :email
    column :name
    column :avatar
    column :admin
    column :created_at
    
    actions
  end
end
