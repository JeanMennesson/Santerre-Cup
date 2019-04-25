ActiveAdmin.register User do
  permit_params :email, :admin

  index do
    selectable_column
    column :id
    column :email
    column :name
    column :created_at
    column :admin
    actions
  end

  form do |f|
    f.inputs "Identité" do
      f.input :email
    end
    f.inputs 'Administrateur ?' do
      f.input :admin
    end
    f.actions
  end
end
