class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = Order.includes(:reservation, :staff, :table, :order_items).all
  end

  def show
  end

    # Strong params để cho phép các thuộc tính của order và order_items
    def order_params
      params.require(:order).permit(
        :reservation_id, :table_id, :order_date, :staff_id, :status,
        order_items_attributes: [:id, :menu_item_id, :quantity, :price, :_destroy]
      )
    end

  def new
    @order = Order.new
    @order.order_items.build # Khởi tạo một order item mặc định
  end

  def edit
    @order.order_items.build if @order.order_items.empty?  # Khởi tạo order item nếu không có item nào
  end

  def create
    @order = Order.new(order_params)
  
    # Đặt giá trị mặc định cho status nếu không được truyền từ form
    @order.status ||= 'open'
  
    # Nếu có reservation_id, tự động gán table_id từ reservation
    if @order.reservation_id.present?
      reservation = Reservation.find_by(id: @order.reservation_id)
      if reservation.present?
        @order.table_id = reservation.table_id
      else
        @order.errors.add(:reservation_id, "is invalid")
      end
    end
  
    # Gán giá trị staff_id cho từng order_item
    @order.order_items.each do |item|
      item.staff_id ||= @order.staff_id
    end
  
    # Tính toán tổng tiền
    @order.calculate_total_amount
  
    respond_to do |format|
      if @order.save
        @order.table.update(status: 'occupied') if @order.table.present?
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def update
    # Gán giá trị price cho order_items nếu chưa có
    @order.order_items.each do |item|
      item.price ||= MenuItem.find(item.menu_item_id).price
    end
  
    respond_to do |format|
      if @order.update(order_params)
        @order.calculate_total_amount # Cập nhật lại tổng tiền khi OrderItems thay đổi
        @order.table.update(status: 'available') if @order.closed?
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    table = @order.table
    @order.destroy
    table.update(status: 'available') if table.present? && table.occupied?

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Thiết lập order cho các hành động khác như show, edit, update, destroy
  def set_order
    @order = Order.find(params[:id])
  end
end
