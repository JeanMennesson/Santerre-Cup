ActiveAdmin.register Pull do
  permit_params :gender, :size, :number

  index do
    selectable_column
    column 'ID', :id
    column "Modèle", :gender
    column "Taille", :size
    column 'Nombre', :number
    column 'Acheteur', :profile
    actions
  end
end
