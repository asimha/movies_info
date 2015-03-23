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
    @movies = Movie.where("language = ?", 'kannada')
  end

  def hindi
    @movies = Movie.where("language = ?", 'hindi')
  end

  def tamil
    @movies = Movie.where("language = ?", 'tamil')
  end

  def telagu
    @movies = Movie.where("language = ?", 'telagu')
  end

  def malyalam
    @movies = Movie.where("language = ?", 'malyalam')
  end

  def english
    @movies = Movie.where("language = ?", 'english')
  end

  def others
    @movies = Movie.where("language = ?", 'others')
  end

  private

  def movies_params
    params.require(:movie).permit(:name, :language, :owner_id, :rating)
  end

end
