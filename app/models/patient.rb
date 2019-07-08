class Patient < ApplicationRecord
  has_many :appointments	
  has_many :doctors, through: :appointments, source: :doctor
  validates :name, presence: true	
  validates :number, length: { minimum: 7 }, numericality: { only_integer: true }
end
