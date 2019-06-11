class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
#	before_action :is_admin?, only: [:index]


  def index
    #@appointments = Appointment.paginate(page: params[:page], per_page: 10)
    @appointments = Appointment.where.not(id: nil).joins(:patient).paginate(page: params[:page], per_page: 10)
    if params[:search]
    	#@appointments = @appointments.where(["patient_id LIKE ?","%#{params[:search]}%"])
    	@appointments = @appointments.where(["patients.name LIKE ?","%#{params[:search]}%"])
    	 #Appointment.where.not(id: nil).joins(:patient).where("patients.name = 'sass'")

    end
  end


  def show
  	@appointment = Appointment.find(params[:id])
  	@doctor = @appointment.doctor
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.new
    @doctors = Doctor.paginate(page: params[:page], per_page: 5)
  end

  def edit
    @appointment = Appointment.find(params[:id])  
  end

  def create
    @patient = Patient.find(params[:appointment][:patient_id])
    @appointment = @patient.appointments.new(appointment_params)
    respond_to do |format|
	  	if @appointment.save	
        format.html { redirect_to @appointment, notice: 'appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
	    end
	  end
  end

  def update
  	@appointment = Appointment.find(params[:id]) 
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirmation
  	@appointment = Appointment.find(params[:id])
  	@appointment.confirmation(@appointment.completed)	
  end	

  def destroy

  end


  private 

  def is_admin?
    unless current_user.admin
    	redirect_to patients_path
    end
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  	@doctor = @appointment.doctor
  end  

	def appointment_params
    params.require(:appointment).permit(:date, :completed, :doctor_id, :patient_id)
  end

  
end
