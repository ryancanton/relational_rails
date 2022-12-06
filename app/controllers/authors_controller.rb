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

    def edit 
      @author = Author.find(params[:id])
    end

    def update
      author = Author.find(params[:id])
      author.update(author_params)
      redirect_to "/authors/#{author.id}"
    end


  private
    def author_params
      params.permit(:name, :rating, :alive)
    end
  end