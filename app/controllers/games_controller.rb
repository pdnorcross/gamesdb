class GamesController < ApplicationController
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  require 'csv'
  include GamesHelper

  def index
    if params[:search]
      @games = Game.search(params[:search]).paginate(page: params[:page], per_page: 15)
    else
      @games = Game.all.paginate(page: params[:page], per_page: 15)
    end
    @whole_list = Game.all
    
    respond_to do |format|
        format.html
        format.csv { send_data  @whole_list.to_csv }
    end
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find(params[:id])
  end

  def show
    @game = Game.find(params[:id])
  end

  def searching
    @games = Game.search(params[:search])
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      check_sys(@game)
      owned_or_not_b(@game)
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      check_sys(@game)
      owned_or_not_b(@game)
      redirect_to @game
    else
      render 'edit'
    end
end


def destroy
  @game = Game.find(params[:id])
  @game.destroy
  redirect_to games_path
end

  def console
    name = params[:con]
    system = System.find_by(name: name)
    c_id = system.c_id
    @name = system.name
    @games = Game.where(console_id: c_id)
  end


  def import
    Game.import(params[:file])
    redirect_to root_url, notice: 'Games imported.'
  end

  private

  def game_params
    params.require(:game).permit!
  end
end
