class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  default_scope -> { order(created_at: :desc) }  

  def confirmation(completed)
  	self.completed = completed
  end
  
end


