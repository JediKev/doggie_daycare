class DogsController < ApplicationController
  def index
  	@dogs = Dog.all
  end

  def new
  	@dog = Dog.new
  end

  def create
  	@dog = Dog.new(dog_params)
  	if @dog.save
  		redirect_to dogs_url, notice: "Successfully Saved!"
  	else
  		flash.now[:notice] = "Something Went Wrong :("
  	end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    
  end

private
	def dog_params
		params.require(:dog).permit(:name, :age, :breed)
	end

end
