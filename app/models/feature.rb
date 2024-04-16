class Feature < ApplicationRecord
    validates :external_id, presence: true, uniqueness: true
    validates :magnitude, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :place, presence: true
    validates :time, presence: true
    validates :tsunami, inclusion: { in: [true, false] }
    validates :mag_type, presence: true
    validates :title, presence: true
    validates :longitude, presence: true, numericality: true
    validates :latitude, presence: true, numericality: true
  end
  