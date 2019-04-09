class BooksController < ApplicationController
before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

    def about
    end

    def top
    @books = Book.all
    end

      def index
      @books = Book.all
      @user = current_user
      @book = Book.new
  end

  def show
        @book = Book.find(params[:id])
        @user = @book.user

        @new_book = Book.new
  end

  def new
        @books = Book.all
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @books = Book.all
        @user = current_user
     if @book.save
        flash[:notice] = "Book was successfully save."
        redirect_to book_path(@book)
    else
        render :action => "index"
      end
    end

    def edit
        @book = Book.find(params[:id])
     if @book.user_id != current_user.id
        redirect_to books_path
      end
    end

    def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        redirect_to book_path(@book)
        flash[:notice] = "Book was successfully update."

    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
        flash[:notice] = "Book was successfully destroy."
    end

 private
    def book_params
      params.require(:book).permit(:title, :opinion, :image)
  end
end
