class Patient < ApplicationRecord
  has_many :appointments	
  has_many :doctors, through: :appointments
  #validates :name, presence: true	
	validate :is_admin?
  


  def is_admin?
    unless User.first.admin
      errors.add(:not_admin, "The post not belongs to you || not admin :) ")
    end
  end


end
