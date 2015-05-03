class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  before_action :authenticate_user!
  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:turn, :released_at, :description, :image, :series_id, :amazon_url)
    end
end
