class AuthorsController < ApplicationController
    def index
      @authors = Author.all
    end

    def create
      author = Author.new({
        name: params[:author][:name],
        rating: params[:author][:rating],
        alive: params[:book][:alive]
        })
  
      author.save
  
      redirect_to '/authors'
    end
  end