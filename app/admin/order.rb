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

  sidebar :order_items, :only => :show, :if => proc{order.order_items} do
    order.order_items.each do |order_item|
      ul do
        li order_item.quantity
        li link_to "#{order_item.book.title}", admin_book_path(order_item.book)
      end
    end
  end

  form do |f|
    f.inputs "Order" do
      f.input :user
      f.input :subtotal
      f.input :number
      f.input :completed_at
      f.input :order_total
      unless f.object.new_record?
        if f.object.state == 'in_progress'
          f.input :state,  :label => 'Change state', as: :select, collection: ['in_progress', 'waiting']
        elsif f.object.state == 'waiting'
          f.input :state,  :label => 'Change state', as: :select, collection: ['waiting', 'in_delivery']
        elsif f.object.state == 'in_delivery'
          f.input :state,  :label => 'Change state', as: :select, collection: ['in_delivery', 'delivered']
        elsif f.object.state == 'delivered'
          f.input :state, :disabled => true
        end
      end
    end
    f.actions
  end

end
