class AuthorsController < ApplicationController
    def index
      @authors = Author.order(created_at: :desc).limit(200)
    end

    def new
    end

    def create
      author = Author.create(author_params)
  
      redirect_to '/authors'
    end

    def show
      @author = Author.find(params[:id])
    end

    def books
      @author = Author.find(params[:id])
      @books = Book.where(author_id: @author.id)
    end

  private
    def author_params
      params.permit(:name, :rating, :alive)
    end
  end