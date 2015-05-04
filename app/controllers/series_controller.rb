class SeriesController < ApplicationController
  before_action :set_series, only: [:show]
  before_action :authenticate_user!

  # GET /series
  # GET /series.json
  def index
    @series = Series.all
  end

  # GET /series/1
  # GET /series/1.json
  def show
    @books = @series.books.order(:turn)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Series.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      params.require(:series).permit(:name, :author, :description, :image)
    end
end
