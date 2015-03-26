class Idea < ActiveRecord::Base
  has_many :students
  validates :author, :title, :description, presence: true
end