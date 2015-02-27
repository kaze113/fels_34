class Word < ActiveRecord::Base
  belongs_to :category
  has_many :definitions, dependent: :destroy
  accepts_nested_attributes_for :definitions

  validates :category_id, presence: true
  validates :content, presence:true, length: { maximum: 20}, 
            uniqueness: { case_sensitive: false }
end
