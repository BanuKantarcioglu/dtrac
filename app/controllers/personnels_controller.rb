class PersonnelsController < ApplicationController

  def index
    @personnels = Personnel.paginate(page: params[:page])
  end

  def show
     @personnel = Personnel.find(params[:id])
  end

  def new
    @personnel = Personnel.new
  end

  def edit
     @personnel = Personnel.find(params[:id])
  end

  def create
    @personnel = Personnel.new(personnel_params)
    if @personnel.save
      # show card with document entry
      flash[:success] = "Personnel card created !"
      redirect_to @personnel
    else
      render 'new'
    end

  end

  def update
    @personnel = Personnel.find(params[:id])
    if @personnel.update_attributes(personnel_params)
      flash[:success] = "Personnel card updated !"
       redirect_to @personnel
    else
      render 'edit'
    end
  end

  private
  def personnel_params
    params.require(:personnel).permit(:name, :pno, :jobdescription,:status)
  end
end
