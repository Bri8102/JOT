class Task < ApplicationRecord
    belongs_to :list

    validates :name, presence: true

    def completed?
        !completed_at.blank?
    end

end
