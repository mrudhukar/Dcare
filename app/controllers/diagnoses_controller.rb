class DiagnosesController < ApplicationController
  
  skip_before_filter :require_login
  
   def new
     @diagnosis = Diagnosis.new
   end
   
   def create
     @diagnosis = Diagnosis.new(params[:diagnosis])
     @diagnosis.user = current_user if current_user
     @diagnosis.valid?
     if @diagnosis.save
       redirect_to diagnosis_url(@diagnosis)
     else
      # @tab = TabConstants::REGISTER
      render :action => "new"
    end
   end
   
   def index
     if current_user
       @diagnoses = Diagnosis.where(:user_id => current_user.id)
       respond_to do |format|
        format.html  # index.html.erb
        format.json  { render :json => @diagnoses }
       end
     end
   end
   
   def show
     @diagnosis = Diagnosis.find(params[:id])
   end
   
   def latest_report
     if current_user
       @diagnosis = Diagnosis.where(:user_id => current_user.id).sort_by { |p| - p.created_at.to_i }.first
       redirect_to diagnosis_url(@diagnosis)     
     end
   end
   
   def edit
     @diagnosis = Diagnosis.find(params[:id])
   end
   
   def update
    @diagnosis = Diagnosis.find(params[:id])
    if @diagnosis.update_attributes(params[:diagnosis])
      flash[:notice] = "Successfully updated report"
      redirect_to diagnosis_path(@diagnosis)
    else
      render :action => "edit"
    end
  end
   
end
