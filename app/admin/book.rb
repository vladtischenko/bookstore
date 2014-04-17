ActiveAdmin.register Book do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  permit_params :title, :short_description, :description, :price,
    :in_stock, :picture, :author_id, :category_id

  index do
    books.each do |book|
      column :id
      column :title
      column :short_description
      column :description
      column :price
      column :in_stock
      column "Picture" do |picture|
        image_tag book.picture_url, :width => 100
      end
      default_actions
    end
  end

  show do |b|
    attributes_table do
      row :id
      row :title
      row :short_description
      row :description
      row :price
      row :in_stock
      row :created_at
      row :updated_at
      row :author_id
      row :category_id
      row :picture do
        image_tag book.picture_url, :width => 100
      end
    end
    active_admin_comments
  end

end
