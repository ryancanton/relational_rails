class BooksController < ApplicationController
    def index
      @books = Book.all
    end

    def new

    end

    def create
      book = Book.new({
        name: params[:book][:name],
        pages: params[:book][:pages],
        fiction: params[:book][:fiction]
        })
  
      book.save
  
      redirect_to '/books'
    end

    def show
      @book = Book.find(params[:id])
    end
  end