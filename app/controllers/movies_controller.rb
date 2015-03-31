class MoviesController < ApplicationController

before_filter :require_login, except: [:home] 

  def new
    @movie = Movie.new
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def create
    @movie = Movie.new(movies_params)
    @movie.owner_id = current_user.id
   if @movie.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def home
  end
  
  def index
    @movies = Movie.all
  end

  def show  
  end

  def kannada
    @movies = Movie.search(params[:search], 'kannada')
  end

  def hindi
    @movies = Movie.search(params[:search], 'hindi')
  end

  def tamil
    @movies = Movie.search(params[:search], 'tamil')
  end

  def telagu
    @movies = Movie.search(params[:search], 'telagu')
  end

  def malyalam
    @movies = Movie.search(params[:search], 'malyalam')
  end

  def english
    @movies = Movie.search(params[:search], 'english')
  end

  def others
    @movies = Movie.search(params[:search], 'others')
  end

  private

  def movies_params
    params.require(:movie).permit(:name, :language, :owner_id, :rating)
  end
end
