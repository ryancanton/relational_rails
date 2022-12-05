class AuthorBooksController < ApplicationController
    def index
        @author = Author.find(params[:id])
        @books = Book.where(author_id: @author.id)
    end

    def new
    end

    def create
        author_id = params[:id]
        Book.create(book_params.merge(author_id))
    end

private
    def book_params
        params.permit(:name, :pages, :fiction)
    end
end