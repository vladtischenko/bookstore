ActiveAdmin.register Order do

  
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

  permit_params :subtotal, :state, :number, :completed_at, :user_id, :shipping, :order_total

  sidebar "Order Items" do
    ul do
      order.order_items.each do |order_item|
        li link_to order_item.book.title, admin_book_path(order_item.book)
      end
      # li link_to("OrderItems", admin_order_order_items(order))
    end
  end

  # table_for order.order_items do
    # column "Order items" do |item|
      # link_to item.book.name, [ :admin, :order_item ]
    # end
  # end

end
