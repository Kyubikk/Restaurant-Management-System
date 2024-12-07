class DashboardsController < ApplicationController
  def index
    @revenue_over_time = Order.where(created_at: 120.days.ago..Time.current).group_by_day(:created_at).sum(:total_amount)
    @top_selling_items = MenuItem.joins(:order_items).group(:name).sum("order_items.quantity")
    @revenue_by_table = Table.joins(:orders).group("tables.table_number").sum("orders.total_amount")
    @reservations_by_time = Reservation.group("DATE_PART('hour', reservation_date)").count
  end
end
