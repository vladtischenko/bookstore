class AddOrderRefToCoupons < ActiveRecord::Migration
  def change
    add_reference :coupons, :order, index: true
  end
end
