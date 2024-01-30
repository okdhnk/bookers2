class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to books_path
    else
      flash[:notice] = "error"
      render :new
    end
  end

  def index
    @user = current_user
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to books_path(@book.id)
    else
      flash[:notice] = "error"
      render :edit
    end
  end


  def destroy
    post_image = Book.find(params[:id])
    post_image.destroy
    redirect_to '/books'
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
