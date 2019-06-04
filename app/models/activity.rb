class Activity < ApplicationRecord


     has_many :logs, dependent: :destroy
     belongs_to :user

     validates :name, :description, :frequency, presence: true
     validates :frequency, inclussion: {in: ['daily', 'weekly'], message: "%{value} is not a valid frequency"}
end
