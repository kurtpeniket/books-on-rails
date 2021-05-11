class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user

    if @book.save!
      flash[:alert] = 'Added!'
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def index
    @books = Book.where("user_id = #{current_user.id}")
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:alert] = 'Deleted!'
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :rating, :isbn)
  end    
end
