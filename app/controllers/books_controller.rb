class BooksController < ApplicationController
  def index
    @books = BookModels.order(:id)
  end

  def show
    @book = BookModels.find(params[:id])
  end

  def new
    @book = BookModels.new
  end

  def create
    @book = BookModels.new(book_params)
    if @book.save
      redirect_to(books_path)
    else
      render('new')
    end
  end

  def edit
    @book = BookModels.find(params[:id])
  end

  def update
    @book = BookModels.find(params[:id])
    #date = params[:published_date].strftime("%m/%d/%Y %I:%m%p")
    if @book.update(book_params)
      redirect_to(books_path)
    else
      render('edit')
    end
  end

  def delete
    @book = BookModels.find(params[:id])
  end

  def destroy
    @book = BookModels.find(params[:id])
    @book.destroy
    redirect_to(books_path)
  end

  private

  def book_params
    params.require(:book_models).permit(:title, :author, :genre, :price, :published_date)
  end
end
