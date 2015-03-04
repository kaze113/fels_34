class Definition < ActiveRecord::Base
  belongs_to :word
  has_many :results

  validates_presence_of :word_def
  
  scope :correct, ->{where(value: true).first}

end