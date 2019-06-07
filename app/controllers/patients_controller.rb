class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :is_admin?



  def index
    @patients = Patient.paginate(page: params[:page], per_page: 10)
  end

  def show
  	@patient = Patient.find(params[:id])
    @appointments = @patient.appointments
  end


  def new
    @patient = Patient.new
    # @appointment = Appointment.new
  end

  def edit
    @patient = Patient.find(params[:id])  
  end


  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
	end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end 



  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
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
