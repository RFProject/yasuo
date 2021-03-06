class FollowsController < ApplicationController
  before_action :set_follow, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /follows
  # GET /follows.json
  def index
    @follows = Follow.all
  end

  # GET /follows/1
  # GET /follows/1.json
  def show
  end

  # GET /follows/new
  def new
    @series = Series.find(params[:series_id])
    @follow = @series.follows.build
    @follow_vaild = @follow
    @follow_vaild.user = current_user
    redirect_to series_index_path,:alert => 'Alredy you have followed this series!' unless @follow_vaild.valid?


  end

  # GET /follows/1/edit
  def edit
  end

  # POST /follows
  # POST /follows.json
  def create
    @series = Series.find(params[:series_id])
    @follow = @series.follows.build
    @follow.user = current_user
    @follow.series = @series
    respond_to do |format|
      if @follow.save
        format.html { redirect_to series_index_path, notice: 'Follow was successfully created.' }
        format.json { render :show, status: :created, location: @follow }
      else
        format.html { render :new }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /follows/1
  # PATCH/PUT /follows/1.json
  def update
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to @follow, notice: 'Follow was successfully updated.' }
        format.json { render :show, status: :ok, location: @follow }
      else
        format.html { render :edit }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.json
  def destroy
    @follow.destroy
    respond_to do |format|
      format.html { redirect_to series_index_url, notice: 'Follow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def follow_params
      params.require(:follow).permit(:series_id)
    end
end
