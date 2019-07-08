class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?

  def index
    @doctors = Doctor.paginate(page: params[:page], per_page: 5)
  end

  def show; end

  def new
    @doctor = Doctor.new
  end

  def edit; end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor, notice: 'Doctor was successfully created.' 
    else
      render :new 
    end
	end

  def update
    if @doctor.update(doctor_params)
      redirect_to @doctor, notice: 'Doctor was successfully updated.' 
    else
      render :edit 
    end
  end 

  def destroy
    @doctor.destroy
    redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' 
  end

  private 

    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:name, :designation)
    end

    def is_admin?
      redirect_to new_patient_path unless current_user.admin
    end
end
