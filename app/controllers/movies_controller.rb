class MoviesController < ApplicationController

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movies_params)
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

  def hindhi
    @movies = Movie.where("language = ?", 'hindhi')
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
