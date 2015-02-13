class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  validates :title, presence:true
  validates :intro, presence:true, length: { maximum: 140}
end
