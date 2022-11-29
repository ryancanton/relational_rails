class BooksController < ApplicationController
    def index
      @books = Book.all
    end

    def create
      book = Book.new({
        author_id: params[:book][:author_id],
        name: params[:book][:name],
        pages: params[:book][:pages],
        fiction: params[:book][:fiction]
        })
  
      book.save
  
      redirect_to '/books'
    end
  end