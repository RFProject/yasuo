class ReadsController < ApplicationController
  before_action :set_read, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /reads
  # GET /reads.json
  def index
    @reads = Read.all
  end

  # GET /reads/1
  # GET /reads/1.json
  def show
  end

  # GET /reads/new
  def new
    @read = Read.new
  end

  # GET /reads/1/edit
  def edit
  end

  # POST /reads
  # POST /reads.json
  def create
    @read = Read.new(read_params)

    respond_to do |format|
      if @read.save
        format.html { redirect_to @read, notice: 'Read was successfully created.' }
        format.json { render :show, status: :created, location: @read }
      else
        format.html { render :new }
        format.json { render json: @read.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reads/1
  # PATCH/PUT /reads/1.json
  def update
    respond_to do |format|
      if @read.update(read_params)
        format.html { redirect_to @read, notice: 'Read was successfully updated.' }
        format.json { render :show, status: :ok, location: @read }
      else
        format.html { render :edit }
        format.json { render json: @read.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reads/1
  # DELETE /reads/1.json
  def destroy
    @read.destroy
    respond_to do |format|
      format.html { redirect_to reads_url, notice: 'Read was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_read
      @read = Read.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def read_params
      params.require(:read).permit(:user_id, :book_id)
    end
end
