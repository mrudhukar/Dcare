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
     
   end
   
   def show
     @diagnosis = Diagnosis.find(params[:id])
   end
   
end
