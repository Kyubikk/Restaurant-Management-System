class CatesController < ApplicationController
  before_action :set_cate, only: %i[ show edit update destroy ]

  # GET /cates or /cates.json
  def index
    @cates = Cate.all
  end

  # GET /cates/1 or /cates/1.json
  def show
    @cate = Cate.find(params[:id])
  end

  # GET /cates/new
  def new
    @cate = Cate.new
  end

  # GET /cates/1/edit
  def edit
  end

  # POST /cates or /cates.json
  def create
    @cate = Cate.new(cate_params)

    respond_to do |format|
      if @cate.save
        format.html { redirect_to cate_url(@cate), notice: "Cate was successfully created." }
        format.json { render :show, status: :created, location: @cate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cates/1 or /cates/1.json
  def update
    respond_to do |format|
      if @cate.update(cate_params)
        format.html { redirect_to cate_url(@cate), notice: "Cate was successfully updated." }
        format.json { render :show, status: :ok, location: @cate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cates/1 or /cates/1.json
  def destroy
    @cate.destroy

    respond_to do |format|
      format.html { redirect_to cates_url, notice: "Cate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cate
      @cate = Cate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cate_params
      params.require(:cate).permit(:cate_name, :description)
    end
end
