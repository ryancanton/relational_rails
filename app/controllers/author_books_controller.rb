class AuthorBooksController < ApplicationController
    def index
        @author = Author.find(params[:id])
        @books = Book.where(author_id: @author.id)
        if params[:alpha]
            @books = Book.alphabetize(@author.id)
        end
        if params[:threshold]
            @books = Book.above_threshold(params[:threshold], @author.id)
        end
    end

    def new
        @author = Author.find(params[:id])
    end

    def create
        Book.create({
        name: params[:name],
        pages: params[:pages],
        fiction: params[:fiction],
        author_id: params[:id]
        })

        redirect_to "/authors/#{params[:id]}/books"
    end

private
    def book_params
        params.permit(:name, :pages, :fiction, :id)
    end
end