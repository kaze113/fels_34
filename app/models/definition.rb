class Definition < ActiveRecord::Base
  belongs_to :word
  validates_presence_of :word_def
end
