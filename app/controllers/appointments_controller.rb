class AppointmentsController < ApplicationController
 before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  def index
    @appointments = Appointment.all
  end


  def show
  	@appointment = Appointment.find(params[:id])
  	@doctor = @appointment.doctor
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.new
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
    # respond_to do |format|
    #   if @appointment.update(appointment_params)
    #     format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @appointment }
    #   else
    #     format.html { render :confirmation }
    #     format.json { render json: @appointment.errors, status: :unprocessable_entity }
    #   end
    # end  	
  end	

  def destroy

  end


  private 

  def set_appointment
    # @patient = Patient.find(params[:appointment][:patient_id])
    # @appointment = @patient.appointments.find(params[:id])
    @appointment = Appointment.find(params[:id])
  	@doctor = @appointment.doctor
  end  

	def appointment_params
      params.require(:appointment).permit(:date, :completed, :doctor_id, :patient_id)
  end

  

end
