ActiveAdmin.register Like do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :likeable_type, :likeable_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :likeable_type, :likeable_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    column :id
    column :user
    column :created_at
    column :updated_at
    column "Likeable Type", :likeable_type
    column "Likeable" do |like|
      likeable = like.likeable
      "#{likeable.class.name} ##{likeable.id}"
    end
    actions
  end
  
end
