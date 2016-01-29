class DogsController < ApplicationController
  def index
    @dogs = Dog.find :all
  end

  def show
    @dog = Dog.find params[:id]
  end

  def new
    @dog = Dog.new
  end

  def edit
    @dog = Dog.find params[:id]
    #@upload = @dog.uploads.build
  end

  def update
    @dog = Dog.find params[:id]
    #@upload = @dog.uploads.new
    @upload = @dog.uploads.build

    respond_to do |format|
      if @dog.update_attributes params[:dog]
        @upload.save
         #@upload.update_attributes params[:upload]
        #format.html { render :text => params.inspect }
        #format.html { render :text => @upload }
        format.html { redirect_to(@dog, :note => 'Dog was successfully updated.') }
        format.xml  { head :ok}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dog.errors, :status => :unprocessable_entity }
      end
    end
  end

  def create
    @dog = Dog.new params[:dog]

    if @dog.save
      flash[:notice] = 'Dog was successfully created.'
      redirect_to @dog
    else
      render :action => "new"
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy

    respond_to do |format|
      format.html { redirect_to(dogs_url) }
      format.xml  { head :ok }
    end
  end
end
