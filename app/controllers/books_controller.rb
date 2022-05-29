class BooksController < ApplicationController
  
  def new
    @books = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
     @user = current_user
     @books = Book.all
      render :index
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @book2 = Book.find(params[:id])
    @user = @book2.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id == current_user.id
    else
        redirect_to books_path
    end
  end

  def update
  @book = Book.find(params[:id])
    if @book.update(books_params)
        redirect_to book_path(@book.id)
    else
        render :edit
    end
  flash[:notice] = "You have updated book successfully."
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  private

  def books_params
   params.require(:book).permit(:title, :body, :image)
  end

end
