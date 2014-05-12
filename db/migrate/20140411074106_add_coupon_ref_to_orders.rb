class AddCouponRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :coupon, index: true
  end
end
