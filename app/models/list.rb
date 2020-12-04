class List < ApplicationRecord
    has_many :tasks, :dependent => :destroy
    belongs_to :user 
    # has_many :user_lists
    # has_many :users, through: :user_lists
  
    validates_presence_of :title, presence: true
    validates :description, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }

    # accepts_nested_attributes_for :tasks
end
