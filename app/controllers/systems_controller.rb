class SystemsController < ApplicationController
  require 'csv'
  include SettingsHelper
      
  def index
     @systems = System.all.paginate(page: params[:page], per_page: 15)    
     @whole_list = System.all
     respond_to do |format|
        format.html
        format.csv { send_data @whole_list.to_csv }
     end
  end
    
  def new
    @system = System.new
  end

  def edit
    @system = System.find(params[:id])
  end

  def show
    @system = System.find(params[:id])
  end
  
  def create
    @system = System.create(system_params)
    add_url(@system)
    if @system.save
      look_for_games(@system)
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def update
    @system = System.find(params[:id])
    if @system.update(system_params)
      redirect_to @system
    else
      render 'edit'
    end
  end
    
  def import
    System.import(params[:file])
    add_url
    redirect_to action: 'index', notice: "Systems imported."
  end
  
  private
  
  def system_params
    params.require(:system).permit!
  end
  
end

