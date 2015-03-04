class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :results
  has_many :words, through: :results
  has_many :definition, through: :results

  accepts_nested_attributes_for :results

end
