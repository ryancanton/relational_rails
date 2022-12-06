class AuthorsController < ApplicationController
    def index
      @authors = Author.order(created_at: :desc)
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

    def destroy
      author = Author.find(params[:id])
      Book.where(author_id: params[:id]).destroy_all
      author.destroy
      redirect_to "/authors"
    end


  private
    def author_params
      params.permit(:name, :rating, :alive)
    end
  end