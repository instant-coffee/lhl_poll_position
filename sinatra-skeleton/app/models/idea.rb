class Idea < ActiveRecord::Base
  has_many :students
  validates :title, :description, presence: true
end