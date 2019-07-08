class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show]
  before_action :find_appointment, only: [:edit, :update, :confirmation]
  before_action :find_patient, only: [:new, :create]


  def index
    @appointments = Appointment.paginate(page: params[:page], per_page: 5)
    if params[:search]
      @appointments = @appointments.joins(:patient).where(["patients.name LIKE ?","%#{params[:search]}%"])
    end
  end

  def show; end

  def new
    @appointment = @patient.appointments.new
    @doctors = Doctor.paginate(page: params[:page], per_page: 6)
  end

  def edit; end

  def create
    @appointment = @patient.appointments.new(appointment_params)
    if @appointment.save  
      redirect_to @appointment, notice: 'appointment was successfully created.' 
    else
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
     redirect_to @appointment, notice: 'Appointment was successfully updated.' 
    else
     render :edit
    end
  end

  def confirmation
    @appointment.confirmation(@appointment.completed) 
  end 


  private 

    def set_appointment
      @appointment = Appointment.find(params[:id])
      @doctor = @appointment.doctor
    end  

    def appointment_params
      params.require(:appointment).permit(:date, :completed, :doctor_id, :patient_id)
    end

    def find_appointment
      @appointment = Appointment.find(params[:id])
    end
     
    def find_patient
      @patient = Patient.find(params[:patient_id])
    end     

end
