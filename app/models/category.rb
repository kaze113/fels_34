class Category < ActiveRecord::Base
  validates :title, presence:true
  validates :intro, presence:true, length: { maximum: 140}
end
