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
    column :id do |book|
      link_to book.id, admin_book_path(book)
    end
    column :title
    column :short_description
    column :description
    column :price
    column :in_stock
    column :picture do |book|
      image_tag book.picture_url, :width => 100
    end
    default_actions
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

  member_action :update, :method => :patch do
    if params[:book][:picture]
      fileUp = params[:book][:picture]
      # orig_filename = fileUp['datafile'].original_filename
      orig_filename = fileUp.original_filename
      filename = sanitize_filename(orig_filename)
      # AWS::S3::S3Object.store(filename, fileUp['datafile'].read, "bookstore-vlad", :access => :public_read)
      AWS::S3::S3Object.store(filename, fileUp.read, "bookstore-vlad", :access => :public_read)
      url = AWS::S3::S3Object.url_for(filename, "bookstore-vlad", :authenticated => false)
    end

    book = Book.find(params[:id])

    if book.update(book_params)
      # book.remote_picture_url = url if url
      book.picture = url if url
      if book.save
        redirect_to admin_book_path book
      else
        redirect_to admin_book_path book, :notice => 'Error'
      end
    else
      redirect_to admin_book_path book, :notice => 'Error'
    end
  end

  member_action :create, :method => :post do
    if params[:book][:picture]
      fileUp = params[:book][:picture]
      orig_filename = fileUp.original_filename
      filename = sanitize_filename(orig_filename)
      AWS::S3::S3Object.store(filename, fileUp.read, "bookstore-vlad", :access => :public_read)
      url = AWS::S3::S3Object.url_for(filename, "bookstore-vlad", :authenticated => false)
    end
    book = Book.new(book_params)
    # book.remote_picture1_url = url if url
    book.picture = url if url

    if book.save
      redirect_to admin_book_path book
    else
      redirect_to admin_book_path book, :notice => 'Error'
    end 
  end

  # member_action :destroy, :method => :delete do
  #   book = Book.find(params[:id])
  #   AWS::S3::S3Object.find(book.picture.filename, "bookstore-vlad").delete
  #   book.picture.destroy
  #   book.destroy
  #   redirect_to admin_book_path
  # end

  member_action :sanitize_filename do |file_name|
    just_filename = File.basename(file_name)
    just_filename.sub(/[^\w\.\-]/,'_')
  end

  member_action :book_params do
    params.require(:book).permit(:title, :short_description, :description,
        :picture, :price, :in_stock, :category_id, :author_id)
  end

end
