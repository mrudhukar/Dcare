class DiagnosesController < ApplicationController
  load_and_authorize_resource
  
  def new
    @diagnosis = Diagnosis.new
  end

  def create
    @diagnosis = Diagnosis.new(params[:diagnosis])
    @diagnosis.user = current_user
    if @diagnosis.save
      redirect_to edit_diagnosis_url(@diagnosis, :first_visit => true)
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
    unless request.xhr?
      @first_visit  = params[:first_visit]
      @diag_tab     = params[:entity]

      @blood         = @diagnosis.blood         || @diagnosis.build_blood
      @anthropometry = @diagnosis.anthropometry || @diagnosis.build_anthropometry
      @urine         = @diagnosis.urine         || @diagnosis.build_urine
      @other         = @diagnosis.other         || @diagnosis.build_other
    end
  end
 
  def update
    if @diagnosis.update_attributes(params[:diagnosis].except(:user_id))
      redirect_to diagnosis_path(@diagnosis), :notice => "Successfully updated the report"
    else
      render action: "edit"
    end
  end

  def destroy
    @diagnosis.destroy
    redirect_to diagnoses_url(), :notice => "Successfully deleted the report"
  end
   
end
