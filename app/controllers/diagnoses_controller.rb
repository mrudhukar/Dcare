class DiagnosesController < ApplicationController
    load_and_authorize_resource
  
  def new
    @diagnosis = Diagnosis.new
  end

  def create
    @diagnosis = Diagnosis.new(params[:diagnosis])
    @diagnosis.user = current_user
    if @diagnosis.save
      redirect_to diagnosis_url(@diagnosis)
    else
      # @tab = TabConstants::REGISTER
      render :action => "new"
    end
  end
 
  def index
    @diagnoses = current_user.diagnoses
  end
 
  def show
  end
 
  def edit
  end
 
  def update
    if @diagnosis.update_attributes(params[:diagnosis])
      redirect_to diagnosis_path(@diagnosis), :notice => "Successfully updated report"
    else
      render action: "edit"
    end
  end

  def destroy
    @diagnosis.destroy
    redirect_to diagnoses_url(), :notice => "Successfully deleted the report"
  end
   
end
