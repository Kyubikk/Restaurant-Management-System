class TablesController < ApplicationController
  before_action :set_table, only: %i[show edit update destroy reserve check_in checkout]

  # GET /tables or /tables.json
  def index
    @tables = Table.all
  end

  # GET /tables/1 or /tables/1.json
  def show
  end

  # GET /tables/new
  def new
    @table = Table.new
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables or /tables.json
  def create
    @table = Table.new(table_params)

    respond_to do |format|
      if @table.save
        format.html { redirect_to table_url(@table), notice: "Table was successfully created." }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1 or /tables/1.json
  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to table_url(@table), notice: "Table was successfully updated." }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1 or /tables/1.json
  def destroy
    @table.destroy

    respond_to do |format|
      format.html { redirect_to tables_url, notice: "Table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST /tables/:id/reserve
  def reserve
    if @table.available?
      @reservation = @table.build_reservation(
        customer_name: params[:customer_name],
        reserved_from: params[:reserved_from],
        reserved_to: params[:reserved_to]
      )
      if @reservation.save
        @table.update(status: 'reserved')
        redirect_to @table, notice: 'Table successfully reserved!'
      else
        redirect_to @table, alert: 'Failed to reserve table. Please check the details.'
      end
    else
      redirect_to @table, alert: 'Table is not available for reservation.'
    end
  end

  # POST /tables/:id/check_in
  def check_in
    if @table.reserved? || @table.available?
      @table.update(status: 'occupied')
      Order.create(table_id: @table.id, status: 'open')
      redirect_to @table, notice: 'Customer successfully checked in!'
    else
      redirect_to @table, alert: 'Table is already occupied.'
    end
  end

  # POST /tables/:id/checkout
  def checkout
    @order = @table.current_order
    if @order
      @order.update(status: 'paid')
      @table.update(status: 'available')
      redirect_to @table, notice: 'Checkout completed successfully!'
    else
      redirect_to @table, alert: 'No active order found for this table.'
    end
  end

  private

  def set_table
    @table = Table.find(params[:id])
  end

  def table_params
    params.require(:table).permit(:table_number, :seating_capacity, :status)
  end
end
