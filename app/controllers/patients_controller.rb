class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :is_admin?


  def index
    @patients = Patient.paginate(page: params[:page], per_page: 10)
  end

  def show
    @appointments = @patient.appointments
  end

  def new
    @patient = Patient.new
  end

  def edit; end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
     redirect_to @patient, notice: 'patient was successfully created.' 
    else
      render :new 
    end
	end

  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Patient was successfully updated.' 
    else
      render :edit 
    end
  end 

  def destroy
    @patient.destroy
    redirect_to patients_url, notice: 'Patient was successfully destroyed.' 
  end


  private 

    def is_admin?
      if current_user.admin
        redirect_to new_doctor_path
      end
    end

    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:name , :illness, :number)
    end

end
