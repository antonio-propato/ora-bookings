class Restaurant < ApplicationRecord
  has_many_attached :pictures
  validates :name, :location, :cuisine, :description, presence: true
end
