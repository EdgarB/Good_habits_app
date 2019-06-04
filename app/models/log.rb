class Log < ApplicationRecord
    belongs_to :activity

    validates :done_at, :description, presence: true

end
